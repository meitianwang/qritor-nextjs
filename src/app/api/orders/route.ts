import { NextRequest } from "next/server";
import { getCurrentUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError } from "@/lib/api-response";
import { createOrder, getOrdersByUserId } from "@/lib/services/order-service";

export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser(request);
    const orders = await getOrdersByUserId(user.id);
    return apiSuccess(orders);
  } catch (e) {
    if (
      e instanceof Response ||
      (e && typeof e === "object" && "status" in e)
    ) {
      return e as Response;
    }
    return apiError(500, "获取订单列表失败");
  }
}

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request);
    const body = await request.json();
    const { planName } = body;

    if (!planName) {
      return apiError(400, "缺少 planName 参数");
    }

    const order = await createOrder(user.id, planName);
    return apiSuccess(order);
  } catch (e) {
    if (
      e instanceof Response ||
      (e && typeof e === "object" && "status" in e)
    ) {
      return e as Response;
    }
    const message = e instanceof Error ? e.message : "创建订单失败";
    if (
      message.includes("订阅计划") ||
      message.includes("免费计划") ||
      message.includes("用户不存在")
    ) {
      return apiError(400, message);
    }
    console.error("创建订单异常:", e);
    return apiError(500, "创建订单失败，请稍后重试");
  }
}
