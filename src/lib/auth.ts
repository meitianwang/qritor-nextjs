import * as jose from 'jose'

const JWT_SECRET = new TextEncoder().encode(process.env.JWT_SECRET || '')
const ALGORITHM = 'HS256'
const ACCESS_TOKEN_EXPIRE_MINUTES = parseInt(process.env.ACCESS_TOKEN_EXPIRE_MINUTES || '60')
const REFRESH_TOKEN_EXPIRE_DAYS = parseInt(process.env.REFRESH_TOKEN_EXPIRE_DAYS || '7')

export async function createAccessToken(subject: string | number): Promise<string> {
  const exp = Math.floor(Date.now() / 1000) + ACCESS_TOKEN_EXPIRE_MINUTES * 60
  return new jose.SignJWT({ sub: String(subject) })
    .setProtectedHeader({ alg: ALGORITHM })
    .setExpirationTime(exp)
    .sign(JWT_SECRET)
}

export async function decodeToken(token: string): Promise<jose.JWTPayload | null> {
  try {
    const { payload } = await jose.jwtVerify(token, JWT_SECRET, { algorithms: [ALGORITHM] })
    return payload
  } catch {
    return null
  }
}

export function getAccessTokenExpireMinutes(): number {
  return ACCESS_TOKEN_EXPIRE_MINUTES
}

export function getRefreshTokenExpireDays(): number {
  return REFRESH_TOKEN_EXPIRE_DAYS
}
