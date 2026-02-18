import { NextRequest } from 'next/server'
import { apiSuccess, apiError } from '@/lib/api-response'
import { getCurrentUser } from '@/lib/middleware/auth-middleware'
import { r2StorageService } from '@/lib/services/storage-service'

const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'gif', 'webp']
const MAX_FILE_SIZE = 5 * 1024 * 1024 // 5MB

export async function POST(request: NextRequest) {
  try {
    await getCurrentUser(request)

    const formData = await request.formData()
    const file = formData.get('file') as File | null

    if (!file) {
      return apiError(400, '请上传文件')
    }

    // Validate file size
    if (file.size > MAX_FILE_SIZE) {
      return apiError(400, '文件大小不能超过 5MB')
    }

    // Validate extension
    const ext = file.name.split('.').pop()?.toLowerCase() || ''
    if (!ALLOWED_EXTENSIONS.includes(ext)) {
      return apiError(400, `不支持的文件格式: ${ext}，仅支持 ${ALLOWED_EXTENSIONS.join(', ')}`)
    }

    const url = await r2StorageService.uploadFile(
      file,
      file.name,
      'feedback',
      ALLOWED_EXTENSIONS,
    )

    return apiSuccess({ url })
  } catch (error) {
    if (error instanceof Response) {
      return error
    }
    console.error('Feedback upload error:', error)
    return apiError(500, `截图上传失败: ${String(error)}`)
  }
}
