import {
  S3Client,
  PutObjectCommand,
  DeleteObjectCommand,
} from '@aws-sdk/client-s3'

// ---------------------------------------------------------------------------
// R2 Storage Service
// ---------------------------------------------------------------------------

class R2StorageService {
  private _client: S3Client | null = null

  // -------------------------------------------------------------------------
  // Lazy-initialised S3 client
  // -------------------------------------------------------------------------

  private get client(): S3Client {
    if (!this._client) {
      const accountId = process.env.R2_ACCOUNT_ID
      const accessKeyId = process.env.R2_ACCESS_KEY_ID
      const secretAccessKey = process.env.R2_SECRET_ACCESS_KEY

      if (!accountId || !accessKeyId || !secretAccessKey) {
        throw new Error('R2 配置不完整，请检查环境变量')
      }

      this._client = new S3Client({
        region: 'auto',
        endpoint: `https://${accountId}.r2.cloudflarestorage.com`,
        credentials: {
          accessKeyId,
          secretAccessKey,
        },
        forcePathStyle: true,
      })
    }
    return this._client
  }

  // -------------------------------------------------------------------------
  // Helpers
  // -------------------------------------------------------------------------

  get isEnabled(): boolean {
    return Boolean(
      process.env.R2_ACCOUNT_ID &&
        process.env.R2_ACCESS_KEY_ID &&
        process.env.R2_SECRET_ACCESS_KEY &&
        process.env.R2_BUCKET_NAME,
    )
  }

  private _guessContentType(ext: string): string {
    const contentTypes: Record<string, string> = {
      jpg: 'image/jpeg',
      jpeg: 'image/jpeg',
      png: 'image/png',
      gif: 'image/gif',
      webp: 'image/webp',
      svg: 'image/svg+xml',
      pdf: 'application/pdf',
      mp3: 'audio/mpeg',
      mp4: 'video/mp4',
    }
    return contentTypes[ext] || 'application/octet-stream'
  }

  // -------------------------------------------------------------------------
  // Public API
  // -------------------------------------------------------------------------

  async uploadFile(
    file: File | Buffer,
    filename: string,
    subDir = 'common',
    allowedExtensions?: string[],
  ): Promise<string> {
    if (!this.isEnabled) {
      throw new Error('R2 存储未启用，请配置 R2 相关环境变量')
    }

    let ext = ''
    if (filename && filename.includes('.')) {
      ext = filename.split('.').pop()!.toLowerCase()
    }

    if (allowedExtensions && !allowedExtensions.includes(ext)) {
      throw new Error(`不支持的文件格式: ${ext}`)
    }

    const uuid = crypto.randomUUID()
    const newFilename = ext ? `${uuid}.${ext}` : uuid
    const objectKey = `${subDir}/${newFilename}`

    // Resolve file content to a Buffer / Uint8Array
    let body: Buffer | Uint8Array
    let contentType: string

    if (Buffer.isBuffer(file)) {
      body = file
      contentType = this._guessContentType(ext)
    } else {
      // Web File API
      const fileObj = file as File
      const arrayBuffer = await fileObj.arrayBuffer()
      body = Buffer.from(arrayBuffer)
      contentType = fileObj.type || this._guessContentType(ext)
    }

    const bucketName = process.env.R2_BUCKET_NAME!

    try {
      await this.client.send(
        new PutObjectCommand({
          Bucket: bucketName,
          Key: objectKey,
          Body: body,
          ContentType: contentType,
        }),
      )

      const publicUrl = `${process.env.R2_PUBLIC_URL}/${objectKey}`
      console.log(`文件上传成功: ${objectKey} -> ${publicUrl}`)
      return publicUrl
    } catch (error) {
      console.error(`R2 上传失败: ${error}`)
      throw error
    }
  }

  async deleteFile(objectKey: string): Promise<boolean> {
    if (!this.isEnabled) {
      return false
    }

    const bucketName = process.env.R2_BUCKET_NAME!

    try {
      await this.client.send(
        new DeleteObjectCommand({
          Bucket: bucketName,
          Key: objectKey,
        }),
      )
      console.log(`文件删除成功: ${objectKey}`)
      return true
    } catch (error) {
      console.error(`R2 删除失败: ${error}`)
      return false
    }
  }

  extractObjectKey(url: string): string | null {
    const publicUrl = process.env.R2_PUBLIC_URL
    if (!url || !publicUrl) {
      return null
    }
    if (url.startsWith(publicUrl)) {
      return url.slice(publicUrl.length).replace(/^\//, '')
    }
    return null
  }
}

export const r2StorageService = new R2StorageService()
