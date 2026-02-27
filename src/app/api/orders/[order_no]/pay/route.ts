import { NextRequest } from "next/server";
import { getCurrentUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError } from "@/lib/api-response";
import { payOrder } from "@/lib/services/order-service";

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ order_no: string }> },
) {
  try {
    const user = await getCurrentUser(request);
    const { order_no } = await params;

    const order = await payOrder(order_no, user.id);
    return apiSuccess(order);
  } catch (e) {
    if (
      e instanceof Response ||
      (e && typeof e === "object" && "status" in e)
    ) {
      return e as Response;
    }
    const message = e instanceof Error ? e.message : "支付失败";
    if (message.includes("无权操作")) {
      return apiError(403, message);
    }
    if (
      message.includes("支付方式") ||
      message.includes("订单") ||
      message.includes("支付")
    ) {
      return apiError(400, message);
    }
    console.error("支付异常:", e);
    return apiError(500, "支付服务暂时不可用，请稍后重试");
  }
}
