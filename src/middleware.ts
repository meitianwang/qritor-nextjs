import { NextRequest, NextResponse } from 'next/server'

const protectedPaths = ['/profile', '/checkout', '/payment', '/referral', '/feedback']

const corsOrigins = (process.env.BACKEND_CORS_ORIGINS || '').split(',').filter(Boolean)

export function middleware(request: NextRequest) {
  const { pathname } = request.nextUrl

  // Handle CORS preflight for API routes
  if (pathname.startsWith('/api/') && request.method === 'OPTIONS') {
    const origin = request.headers.get('origin') || ''
    const isAllowed =
      corsOrigins.length === 0 ||
      corsOrigins.includes(origin) ||
      origin.match(/^http:\/\/localhost:\d+$/)

    return new NextResponse(null, {
      status: 204,
      headers: {
        'Access-Control-Allow-Origin': isAllowed ? origin : '',
        'Access-Control-Allow-Methods': 'GET,POST,PUT,DELETE,OPTIONS,PATCH',
        'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Max-Age': '86400',
      },
    })
  }

  // Add CORS headers to API responses
  if (pathname.startsWith('/api/')) {
    const origin = request.headers.get('origin') || ''
    const isAllowed =
      corsOrigins.length === 0 ||
      corsOrigins.includes(origin) ||
      origin.match(/^http:\/\/localhost:\d+$/)

    const response = NextResponse.next()
    if (isAllowed) {
      response.headers.set('Access-Control-Allow-Origin', origin)
      response.headers.set('Access-Control-Allow-Credentials', 'true')
    }
    return response
  }

  // Admin route protection - redirect to admin login
  if (pathname.startsWith('/admin') && !pathname.startsWith('/admin/login')) {
    const refreshToken = request.cookies.get('refresh_token')?.value
    if (!refreshToken) {
      const loginUrl = new URL('/admin/login', request.url)
      loginUrl.searchParams.set('redirect', pathname)
      return NextResponse.redirect(loginUrl)
    }
  }

  // Protected page routes - check refresh_token cookie
  if (protectedPaths.some((p) => pathname.startsWith(p))) {
    const refreshToken = request.cookies.get('refresh_token')?.value
    if (!refreshToken) {
      const loginUrl = new URL('/login', request.url)
      loginUrl.searchParams.set('redirect', pathname)
      return NextResponse.redirect(loginUrl)
    }
  }

  return NextResponse.next()
}

export const config = {
  matcher: ['/((?!_next|static|public|favicon.ico).*)'],
}
