import { NextRequest } from "next/server";
import { getCurrentUser } from "@/lib/middleware/auth-middleware";
import { apiSuccess, apiError } from "@/lib/api-response";
import { setDefaultPaymentMethod } from "@/lib/services/payment-method-service";

export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ pm_id: string }> },
) {
  try {
    const user = await getCurrentUser(request);
    const { pm_id } = await params;
    await setDefaultPaymentMethod(user.id, pm_id);
    return apiSuccess(null, "已设为默认支付方式");
  } catch (e) {
    if (e instanceof Response) return e;
    const msg = e instanceof Error ? e.message : "设置默认支付方式失败";
    if (
      msg.includes("无权") ||
      msg.includes("不存在") ||
      msg.includes("支付方式")
    ) {
      return apiError(400, msg);
    }
    console.error("设置默认支付方式异常:", e);
    return apiError(500, "操作失败，请稍后重试");
  }
}
