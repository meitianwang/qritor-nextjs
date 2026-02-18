import { Prisma } from '@/generated/prisma/client'

type UserDeletionTx = Pick<
  Prisma.TransactionClient,
  | 'refresh_tokens'
  | 'user_subscriptions'
  | 'referral_rewards'
  | 'boost_pack_purchases'
  | 'orders'
  | 'referrals'
  | 'novel_creation_method'
  | 'credit_transactions'
  | 'user_settings'
  | 'token_blacklist'
  | 'image_generation_task'
  | 'verification_codes'
  | 'users'
>

interface DeleteUserRelationsOptions {
  userEmail?: string
}

// Keep user data cleanup in application code so we do not depend on DB cascades.
export async function deleteUserWithRelationsInTx(
  tx: UserDeletionTx,
  userId: bigint,
  options: DeleteUserRelationsOptions = {},
): Promise<void> {
  await tx.refresh_tokens.deleteMany({ where: { user_id: userId } })
  await tx.user_subscriptions.deleteMany({ where: { user_id: userId } })
  await tx.referral_rewards.deleteMany({ where: { user_id: userId } })
  await tx.boost_pack_purchases.deleteMany({ where: { user_id: userId } })
  await tx.orders.deleteMany({ where: { user_id: userId } })
  await tx.referrals.deleteMany({
    where: {
      OR: [{ inviter_id: userId }, { invitee_id: userId }],
    },
  })
  await tx.novel_creation_method.deleteMany({ where: { user_id: userId } })
  await tx.credit_transactions.deleteMany({ where: { user_id: userId } })
  await tx.user_settings.deleteMany({ where: { user_id: userId } })
  await tx.token_blacklist.deleteMany({ where: { user_id: userId } })
  await tx.image_generation_task.deleteMany({ where: { user_id: userId } })

  if (options.userEmail) {
    await tx.verification_codes.deleteMany({
      where: {
        code_key: {
          startsWith: `${options.userEmail}:`,
        },
      },
    })
  }

  await tx.users.delete({ where: { id: userId } })
}
