import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { apiSuccess, apiError } from "@/lib/api-response";
import {
  createAccessToken,
  getAccessTokenExpireMinutes,
  getRefreshTokenExpireDays,
} from "@/lib/auth";
import { authService, hashPassword } from "@/lib/services/auth-service";
import { initUserDefaultSubscription } from "@/lib/services/subscription-service";
import { processReferral } from "@/lib/services/referral-service";
import { createDesktopAuthTicket } from "@/lib/services/desktop-auth-ticket-service";

interface GoogleTokenResponse {
  access_token: string;
  token_type: string;
  expires_in: number;
  id_token?: string;
}

interface GoogleUserInfo {
  sub: string;
  email: string;
  name?: string;
  picture?: string;
  email_verified?: boolean;
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const {
      code,
      redirect_uri,
      redirectUri,
      referral_code,
      referralCode,
      client,
    } = body as {
      code?: string;
      redirect_uri?: string;
      redirectUri?: string;
      referral_code?: string;
      referralCode?: string;
      client?: string;
    };
    const normalizedRedirectUri = redirect_uri || redirectUri;
    const normalizedReferralCode = referral_code || referralCode;

    if (!code || !normalizedRedirectUri) {
      return apiError(400, "请提供 code 和 redirect_uri");
    }

    const clientId = process.env.GOOGLE_CLIENT_ID;
    const clientSecret = process.env.GOOGLE_CLIENT_SECRET;
    if (!clientId || !clientSecret) {
      return apiError(500, "Google OAuth 未配置");
    }

    // Exchange code for access token
    const tokenResponse = await fetch("https://oauth2.googleapis.com/token", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({
        code,
        client_id: clientId,
        client_secret: clientSecret,
        redirect_uri: normalizedRedirectUri,
        grant_type: "authorization_code",
      }),
    });

    if (!tokenResponse.ok) {
      const errorText = await tokenResponse.text();
      return apiError(400, `Google 授权失败: ${errorText}`);
    }

    const tokenData = (await tokenResponse.json()) as GoogleTokenResponse;

    // Get user info from Google
    const userInfoResponse = await fetch(
      "https://www.googleapis.com/oauth2/v3/userinfo",
      {
        headers: { Authorization: `Bearer ${tokenData.access_token}` },
      },
    );

    if (!userInfoResponse.ok) {
      return apiError(400, "获取 Google 用户信息失败");
    }

    const googleUser = (await userInfoResponse.json()) as GoogleUserInfo;

    if (!googleUser.email) {
      return apiError(400, "无法获取 Google 邮箱");
    }

    const normalizedEmail = googleUser.email.toLowerCase();

    // Find or create user
    let user = await prisma.users.findUnique({
      where: { email: normalizedEmail },
    });

    let isNewUser = false;

    if (!user) {
      isNewUser = true;

      // Generate a random password for OAuth users
      const randomPassword = await hashPassword(
        crypto.randomUUID() + crypto.randomUUID(),
      );

      const now = new Date();
      user = await prisma.users.create({
        data: {
          email: normalizedEmail,
          password: randomPassword,
          nickname: googleUser.name || normalizedEmail.split("@")[0],
          avatar: googleUser.picture || null,
          role: "USER",
          created_at: now,
          updated_at: now,
        },
      });

      // Initialize default subscription
      await initUserDefaultSubscription(user.id);

      // Process referral for new users
      if (normalizedReferralCode) {
        try {
          await processReferral(user.id, normalizedReferralCode);
        } catch (e) {
          console.error(`处理邀请码失败: ${String(e)}`);
        }
      }
    }

    // Update last login time
    await prisma.users.update({
      where: { id: user.id },
      data: { last_login_at: new Date() },
    });

    // Create tokens
    const accessToken = await createAccessToken(String(user.id));
    const refreshTokenResult = await authService.refreshToken.createToken(
      user.id,
    );

    const ACCESS_TOKEN_EXPIRE_MINUTES = getAccessTokenExpireMinutes();
    const REFRESH_TOKEN_EXPIRE_DAYS = getRefreshTokenExpireDays();
    const expiresAt = new Date(
      Date.now() + ACCESS_TOKEN_EXPIRE_MINUTES * 60 * 1000,
    ).toISOString();

    const userData = {
      id: Number(user.id),
      nickname: user.nickname,
      email: user.email,
      avatar: user.avatar,
      role: user.role,
      accessToken,
      expiresAt,
    };

    // For desktop client, include refresh token in response body
    if (client === "desktop") {
      const userInfo = {
        id: Number(user.id),
        nickname: user.nickname,
        email: user.email,
        avatar: user.avatar,
        role: user.role,
      };
      const desktopAuthTicket = await createDesktopAuthTicket({
        accessToken,
        refreshToken: refreshTokenResult.rawToken,
        expiresAt,
        expiresIn: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
        user: userInfo,
      });

      return apiSuccess({
        ...userData,
        refreshToken: refreshTokenResult.rawToken,
        isNewUser,
        expiresIn: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
        user: userInfo,
        desktopAuthTicket,
      });
    }

    // For web client, set refresh token as httponly cookie
    const response = NextResponse.json({
      code: 200,
      data: { ...userData, isNewUser },
      message: "success",
    });

    response.cookies.set("refresh_token", refreshTokenResult.rawToken, {
      httpOnly: true,
      secure: process.env.COOKIE_SECURE !== "false",
      sameSite:
        (process.env.COOKIE_SAMESITE as "lax" | "strict" | "none") || "lax",
      domain: process.env.COOKIE_DOMAIN || undefined,
      maxAge: REFRESH_TOKEN_EXPIRE_DAYS * 86400,
      path: "/",
    });

    return response;
  } catch (error) {
    return apiError(500, `Google 登录失败: ${String(error)}`);
  }
}
