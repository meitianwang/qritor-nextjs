import crypto from 'crypto'

interface DesktopAuthTicketPayload {
  accessToken: string
  refreshToken: string
  expiresAt: string
  expiresIn?: number
  user: {
    id: number
    nickname: string
    email: string
    avatar: string | null
    role: string
  }
}

interface TicketRecord {
  payload: DesktopAuthTicketPayload
  expiresAt: number
}

const DESKTOP_TICKET_TTL_MS = 2 * 60 * 1000
const tickets = new Map<string, TicketRecord>()

function cleanupExpiredTickets(): void {
  const now = Date.now()
  for (const [ticket, record] of tickets.entries()) {
    if (record.expiresAt <= now) {
      tickets.delete(ticket)
    }
  }
}

export function createDesktopAuthTicket(payload: DesktopAuthTicketPayload): string {
  cleanupExpiredTickets()
  const ticket = crypto.randomBytes(24).toString('base64url')
  tickets.set(ticket, {
    payload,
    expiresAt: Date.now() + DESKTOP_TICKET_TTL_MS,
  })
  return ticket
}

export function consumeDesktopAuthTicket(ticket: string): DesktopAuthTicketPayload | null {
  cleanupExpiredTickets()
  const record = tickets.get(ticket)
  if (!record) {
    return null
  }

  tickets.delete(ticket)
  if (record.expiresAt <= Date.now()) {
    return null
  }
  return record.payload
}
