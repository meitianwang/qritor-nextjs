import { NextResponse } from 'next/server'

interface ApiResponseData {
  code: number
  data: unknown
  message: string
}

export function apiSuccess(data: unknown = null, message = 'success'): NextResponse<ApiResponseData> {
  return NextResponse.json({ code: 200, data, message })
}

export function apiError(code: number, message: string, data: unknown = null): NextResponse<ApiResponseData> {
  return NextResponse.json({ code, data, message })
}

export function apiUnauthorized(message = '未登录或登录已过期'): NextResponse<ApiResponseData> {
  return NextResponse.json({ code: 401, data: null, message })
}

export function apiForbidden(message = '无权限'): NextResponse<ApiResponseData> {
  return NextResponse.json({ code: 403, data: null, message })
}

export function apiNotFound(message = '资源不存在'): NextResponse<ApiResponseData> {
  return NextResponse.json({ code: 404, data: null, message })
}

export function apiValidationError(message: string): NextResponse<ApiResponseData> {
  return NextResponse.json({ code: 422, data: null, message })
}
