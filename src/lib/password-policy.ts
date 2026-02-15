'use client'

/**
 * Password strength validation policy
 */

const MIN_LENGTH = 8
const REQUIRE_UPPER = true
const REQUIRE_LOWER = true
const REQUIRE_NUMBER = true
const REQUIRE_SPECIAL = true

const COMMON_PASSWORDS = new Set([
    'password',
    '123456',
    '12345678',
    '123456789',
    'qwerty',
    'abc123',
    'letmein',
    'iloveyou',
    'admin',
    'login',
    '111111',
    '000000',
    '123123',
    'passw0rd',
    'dragon'
])

/**
 * Check if a password meets strength requirements
 * @param password - Password to validate
 * @returns true if password is strong enough
 */
export function isPasswordStrong(password: string): boolean {
    if (!password || password.length < MIN_LENGTH) return false
    if (REQUIRE_UPPER && !/[A-Z]/.test(password)) return false
    if (REQUIRE_LOWER && !/[a-z]/.test(password)) return false
    if (REQUIRE_NUMBER && !/[0-9]/.test(password)) return false
    if (REQUIRE_SPECIAL && !/[^A-Za-z0-9]/.test(password)) return false
    if (COMMON_PASSWORDS.has(password.toLowerCase())) return false
    return true
}
