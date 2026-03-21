// ---------------------------------------------------------------------------
// BGM (Background Music) categories and items
// ---------------------------------------------------------------------------

export const BGM_CATEGORIES: Record<string, string> = {
  romantic: '言情',
  suspense: '悬疑',
  action: '动作',
  relaxing: '轻松',
  epic: '史诗',
  sad: '伤感',
  happy: '欢快',
  mysterious: '神秘',
}

interface BgmItem {
  id: string
  name: string
  category: string
  category_name: string
  duration: number
  url: string
  preview_url?: string
  cover?: string
  audio_type: 'bgm'
}

export const BGM_LIST: BgmItem[] = [
  { id: 'romantic-01', name: '浪漫时光', category: 'romantic', category_name: '言情', duration: 120, url: 'https://your-cdn.com/bgm/romantic-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/romantic-01.mp3', cover: 'https://your-cdn.com/bgm/covers/romantic-01.jpg', audio_type: 'bgm' },
  { id: 'romantic-02', name: '甜蜜告白', category: 'romantic', category_name: '言情', duration: 90, url: 'https://your-cdn.com/bgm/romantic-02.mp3', preview_url: 'https://your-cdn.com/bgm/preview/romantic-02.mp3', cover: 'https://your-cdn.com/bgm/covers/romantic-02.jpg', audio_type: 'bgm' },
  { id: 'suspense-01', name: '迷雾重重', category: 'suspense', category_name: '悬疑', duration: 100, url: 'https://your-cdn.com/bgm/suspense-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/suspense-01.mp3', cover: 'https://your-cdn.com/bgm/covers/suspense-01.jpg', audio_type: 'bgm' },
  { id: 'suspense-02', name: '暗夜追踪', category: 'suspense', category_name: '悬疑', duration: 110, url: 'https://your-cdn.com/bgm/suspense-02.mp3', preview_url: 'https://your-cdn.com/bgm/preview/suspense-02.mp3', cover: 'https://your-cdn.com/bgm/covers/suspense-02.jpg', audio_type: 'bgm' },
  { id: 'action-01', name: '热血战斗', category: 'action', category_name: '动作', duration: 95, url: 'https://your-cdn.com/bgm/action-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/action-01.mp3', cover: 'https://your-cdn.com/bgm/covers/action-01.jpg', audio_type: 'bgm' },
  { id: 'relaxing-01', name: '午后阳光', category: 'relaxing', category_name: '轻松', duration: 130, url: 'https://your-cdn.com/bgm/relaxing-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/relaxing-01.mp3', cover: 'https://your-cdn.com/bgm/covers/relaxing-01.jpg', audio_type: 'bgm' },
  { id: 'relaxing-02', name: '清晨微风', category: 'relaxing', category_name: '轻松', duration: 115, url: 'https://your-cdn.com/bgm/relaxing-02.mp3', preview_url: 'https://your-cdn.com/bgm/preview/relaxing-02.mp3', cover: 'https://your-cdn.com/bgm/covers/relaxing-02.jpg', audio_type: 'bgm' },
  { id: 'epic-01', name: '王者归来', category: 'epic', category_name: '史诗', duration: 140, url: 'https://your-cdn.com/bgm/epic-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/epic-01.mp3', cover: 'https://your-cdn.com/bgm/covers/epic-01.jpg', audio_type: 'bgm' },
  { id: 'sad-01', name: '离别之歌', category: 'sad', category_name: '伤感', duration: 105, url: 'https://your-cdn.com/bgm/sad-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/sad-01.mp3', cover: 'https://your-cdn.com/bgm/covers/sad-01.jpg', audio_type: 'bgm' },
  { id: 'happy-01', name: '欢乐时光', category: 'happy', category_name: '欢快', duration: 85, url: 'https://your-cdn.com/bgm/happy-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/happy-01.mp3', cover: 'https://your-cdn.com/bgm/covers/happy-01.jpg', audio_type: 'bgm' },
  { id: 'mysterious-01', name: '古老传说', category: 'mysterious', category_name: '神秘', duration: 125, url: 'https://your-cdn.com/bgm/mysterious-01.mp3', preview_url: 'https://your-cdn.com/bgm/preview/mysterious-01.mp3', cover: 'https://your-cdn.com/bgm/covers/mysterious-01.jpg', audio_type: 'bgm' },
]

// ---------------------------------------------------------------------------
// SFX (Sound Effects) categories and items
// ---------------------------------------------------------------------------

export const SFX_CATEGORIES: Record<string, string> = {
  // 环境音
  ambiance_nature: '自然环境',
  ambiance_urban: '城市环境',
  ambiance_indoor: '室内环境',
  // 动作音效
  action_footsteps: '脚步声',
  action_door: '门声',
  action_impact: '撞击声',
  action_whoosh: '呼啸声',
  // 情绪音效
  emotion_tension: '紧张氛围',
  emotion_romantic: '浪漫氛围',
  emotion_mystery: '神秘氛围',
  // 特效音
  fx_transition: '转场音效',
  fx_notification: '提示音',
  fx_magic: '魔法音效',
}

interface SfxItem {
  id: string
  name: string
  category: string
  category_name: string
  duration: number
  url: string
  tags: string[]
  audio_type: 'sfx'
}

export const SFX_LIST: SfxItem[] = [
  // 自然环境
  { id: 'amb-nature-01', name: '森林鸟鸣', category: 'ambiance_nature', category_name: '自然环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-nature-01.mp3', tags: ['森林', '鸟', '自然'], audio_type: 'sfx' },
  { id: 'amb-nature-02', name: '海浪声', category: 'ambiance_nature', category_name: '自然环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-nature-02.mp3', tags: ['海', '浪', '水'], audio_type: 'sfx' },
  { id: 'amb-nature-03', name: '雨声', category: 'ambiance_nature', category_name: '自然环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-nature-03.mp3', tags: ['雨', '水', '天气'], audio_type: 'sfx' },
  { id: 'amb-nature-04', name: '风声', category: 'ambiance_nature', category_name: '自然环境', duration: 20, url: 'https://your-cdn.com/sfx/amb-nature-04.mp3', tags: ['风', '天气'], audio_type: 'sfx' },
  { id: 'amb-nature-05', name: '雷声', category: 'ambiance_nature', category_name: '自然环境', duration: 10, url: 'https://your-cdn.com/sfx/amb-nature-05.mp3', tags: ['雷', '天气', '暴风雨'], audio_type: 'sfx' },
  // 城市环境
  { id: 'amb-urban-01', name: '城市街道', category: 'ambiance_urban', category_name: '城市环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-urban-01.mp3', tags: ['城市', '街道', '车'], audio_type: 'sfx' },
  { id: 'amb-urban-02', name: '咖啡厅', category: 'ambiance_urban', category_name: '城市环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-urban-02.mp3', tags: ['咖啡', '室内', '人声'], audio_type: 'sfx' },
  { id: 'amb-urban-03', name: '地铁站', category: 'ambiance_urban', category_name: '城市环境', duration: 20, url: 'https://your-cdn.com/sfx/amb-urban-03.mp3', tags: ['地铁', '交通'], audio_type: 'sfx' },
  // 室内环境
  { id: 'amb-indoor-01', name: '安静房间', category: 'ambiance_indoor', category_name: '室内环境', duration: 20, url: 'https://your-cdn.com/sfx/amb-indoor-01.mp3', tags: ['安静', '室内'], audio_type: 'sfx' },
  { id: 'amb-indoor-02', name: '办公室', category: 'ambiance_indoor', category_name: '室内环境', duration: 30, url: 'https://your-cdn.com/sfx/amb-indoor-02.mp3', tags: ['办公', '键盘', '室内'], audio_type: 'sfx' },
  // 脚步声
  { id: 'sfx-footsteps-01', name: '木地板脚步', category: 'action_footsteps', category_name: '脚步声', duration: 5, url: 'https://your-cdn.com/sfx/sfx-footsteps-01.mp3', tags: ['脚步', '木地板'], audio_type: 'sfx' },
  { id: 'sfx-footsteps-02', name: '石板路脚步', category: 'action_footsteps', category_name: '脚步声', duration: 5, url: 'https://your-cdn.com/sfx/sfx-footsteps-02.mp3', tags: ['脚步', '石板'], audio_type: 'sfx' },
  { id: 'sfx-footsteps-03', name: '草地脚步', category: 'action_footsteps', category_name: '脚步声', duration: 5, url: 'https://your-cdn.com/sfx/sfx-footsteps-03.mp3', tags: ['脚步', '草地'], audio_type: 'sfx' },
  { id: 'sfx-footsteps-04', name: '跑步声', category: 'action_footsteps', category_name: '脚步声', duration: 5, url: 'https://your-cdn.com/sfx/sfx-footsteps-04.mp3', tags: ['跑步', '快速'], audio_type: 'sfx' },
  // 门声
  { id: 'sfx-door-01', name: '开门声', category: 'action_door', category_name: '门声', duration: 2, url: 'https://your-cdn.com/sfx/sfx-door-01.mp3', tags: ['门', '开门'], audio_type: 'sfx' },
  { id: 'sfx-door-02', name: '关门声', category: 'action_door', category_name: '门声', duration: 2, url: 'https://your-cdn.com/sfx/sfx-door-02.mp3', tags: ['门', '关门'], audio_type: 'sfx' },
  { id: 'sfx-door-03', name: '敲门声', category: 'action_door', category_name: '门声', duration: 3, url: 'https://your-cdn.com/sfx/sfx-door-03.mp3', tags: ['门', '敲门'], audio_type: 'sfx' },
  { id: 'sfx-door-04', name: '门铃声', category: 'action_door', category_name: '门声', duration: 2, url: 'https://your-cdn.com/sfx/sfx-door-04.mp3', tags: ['门铃'], audio_type: 'sfx' },
  // 撞击声
  { id: 'sfx-impact-01', name: '拳击声', category: 'action_impact', category_name: '撞击声', duration: 1, url: 'https://your-cdn.com/sfx/sfx-impact-01.mp3', tags: ['拳击', '打击'], audio_type: 'sfx' },
  { id: 'sfx-impact-02', name: '摔倒声', category: 'action_impact', category_name: '撞击声', duration: 2, url: 'https://your-cdn.com/sfx/sfx-impact-02.mp3', tags: ['摔倒', '撞击'], audio_type: 'sfx' },
  { id: 'sfx-impact-03', name: '玻璃破碎', category: 'action_impact', category_name: '撞击声', duration: 2, url: 'https://your-cdn.com/sfx/sfx-impact-03.mp3', tags: ['玻璃', '破碎'], audio_type: 'sfx' },
  // 呼啸声
  { id: 'sfx-whoosh-01', name: '快速移动', category: 'action_whoosh', category_name: '呼啸声', duration: 1, url: 'https://your-cdn.com/sfx/sfx-whoosh-01.mp3', tags: ['呼啸', '快速'], audio_type: 'sfx' },
  { id: 'sfx-whoosh-02', name: '挥剑声', category: 'action_whoosh', category_name: '呼啸声', duration: 1, url: 'https://your-cdn.com/sfx/sfx-whoosh-02.mp3', tags: ['剑', '挥动'], audio_type: 'sfx' },
  // 紧张氛围
  { id: 'sfx-tension-01', name: '心跳加速', category: 'emotion_tension', category_name: '紧张氛围', duration: 10, url: 'https://your-cdn.com/sfx/sfx-tension-01.mp3', tags: ['心跳', '紧张'], audio_type: 'sfx' },
  { id: 'sfx-tension-02', name: '悬疑音效', category: 'emotion_tension', category_name: '紧张氛围', duration: 5, url: 'https://your-cdn.com/sfx/sfx-tension-02.mp3', tags: ['悬疑', '紧张'], audio_type: 'sfx' },
  // 浪漫氛围
  { id: 'sfx-romantic-01', name: '心动音效', category: 'emotion_romantic', category_name: '浪漫氛围', duration: 3, url: 'https://your-cdn.com/sfx/sfx-romantic-01.mp3', tags: ['心动', '浪漫'], audio_type: 'sfx' },
  // 神秘氛围
  { id: 'sfx-mystery-01', name: '神秘低音', category: 'emotion_mystery', category_name: '神秘氛围', duration: 5, url: 'https://your-cdn.com/sfx/sfx-mystery-01.mp3', tags: ['神秘', '低音'], audio_type: 'sfx' },
  // 转场音效
  { id: 'sfx-trans-01', name: '场景切换', category: 'fx_transition', category_name: '转场音效', duration: 2, url: 'https://your-cdn.com/sfx/sfx-trans-01.mp3', tags: ['转场', '切换'], audio_type: 'sfx' },
  { id: 'sfx-trans-02', name: '时间流逝', category: 'fx_transition', category_name: '转场音效', duration: 3, url: 'https://your-cdn.com/sfx/sfx-trans-02.mp3', tags: ['时间', '转场'], audio_type: 'sfx' },
  // 提示音
  { id: 'sfx-notif-01', name: '手机通知', category: 'fx_notification', category_name: '提示音', duration: 1, url: 'https://your-cdn.com/sfx/sfx-notif-01.mp3', tags: ['手机', '通知'], audio_type: 'sfx' },
  { id: 'sfx-notif-02', name: '消息提示', category: 'fx_notification', category_name: '提示音', duration: 1, url: 'https://your-cdn.com/sfx/sfx-notif-02.mp3', tags: ['消息', '提示'], audio_type: 'sfx' },
  // 魔法音效
  { id: 'sfx-magic-01', name: '魔法释放', category: 'fx_magic', category_name: '魔法音效', duration: 3, url: 'https://your-cdn.com/sfx/sfx-magic-01.mp3', tags: ['魔法', '释放'], audio_type: 'sfx' },
  { id: 'sfx-magic-02', name: '能量聚集', category: 'fx_magic', category_name: '魔法音效', duration: 4, url: 'https://your-cdn.com/sfx/sfx-magic-02.mp3', tags: ['能量', '魔法'], audio_type: 'sfx' },
]
