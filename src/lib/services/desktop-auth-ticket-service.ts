import * as jose from "jose";

const JWT_SECRET_RAW = process.env.JWT_SECRET;
if (!JWT_SECRET_RAW)
  throw new Error("JWT_SECRET environment variable is required");
const JWT_SECRET = new TextEncoder().encode(JWT_SECRET_RAW);
const ALGORITHM = "HS256";
const DESKTOP_TICKET_TTL_SECONDS = 120; // 2 minutes, JWT-based so ticket is replayable within this window

interface DesktopAuthTicketPayload {
  accessToken: string;
  refreshToken: string;
  expiresAt: string;
  expiresIn?: number;
  user: {
    id: number;
    nickname: string;
    email: string;
    avatar: string | null;
    role: string;
  };
}

export async function createDesktopAuthTicket(
  payload: DesktopAuthTicketPayload,
): Promise<string> {
  return new jose.SignJWT({ data: payload })
    .setProtectedHeader({ alg: ALGORITHM })
    .setIssuedAt()
    .setExpirationTime(
      Math.floor(Date.now() / 1000) + DESKTOP_TICKET_TTL_SECONDS,
    )
    .sign(JWT_SECRET);
}

export async function consumeDesktopAuthTicket(
  ticket: string,
): Promise<DesktopAuthTicketPayload | null> {
  try {
    const { payload } = await jose.jwtVerify(ticket, JWT_SECRET, {
      algorithms: [ALGORITHM],
    });
    const data = (payload as Record<string, unknown>).data as
      | DesktopAuthTicketPayload
      | undefined;
    return data || null;
  } catch {
    return null;
  }
}
