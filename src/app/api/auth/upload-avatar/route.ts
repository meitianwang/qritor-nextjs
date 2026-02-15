import { NextRequest } from 'next/server'
import { prisma } from '@/lib/prisma'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { r2StorageService } from '@/lib/services/storage-service'

const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'gif', 'webp']

export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser(request)

    const formData = await request.formData()
    const file = formData.get('file') as File | null

    if (!file) {
      return apiError(400, '请上传文件')
    }

    // Validate extension
    const filename = file.name
    const ext = filename.split('.').pop()?.toLowerCase() || ''
    if (!ALLOWED_EXTENSIONS.includes(ext)) {
      return apiError(400, `不支持的文件格式: ${ext}，仅支持 ${ALLOWED_EXTENSIONS.join(', ')}`)
    }

    // Upload to R2
    const avatarUrl = await r2StorageService.uploadFile(
      file,
      filename,
      'avatars',
      ALLOWED_EXTENSIONS,
    )

    // Delete old avatar if exists
    if (user.avatar) {
      const oldKey = r2StorageService.extractObjectKey(user.avatar)
      if (oldKey) {
        await r2StorageService.deleteFile(oldKey)
      }
    }

    // Update user avatar
    const updatedUser = await prisma.users.update({
      where: { id: user.id },
      data: {
        avatar: avatarUrl,
        updated_at: new Date(),
      },
    })

    return apiSuccess({
      id: Number(updatedUser.id),
      nickname: updatedUser.nickname,
      email: updatedUser.email,
      avatar: updatedUser.avatar,
      role: updatedUser.role,
    })
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    return apiError(500, `上传头像失败: ${String(error)}`)
  }
}
