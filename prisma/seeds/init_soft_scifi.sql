-- 软科幻小说创作方法（中文）
-- novel_type = 软科幻, language = zh
-- Usage: mysql -u root -p qritor_dev < init_soft_scifi.sql

-- 1. 创建创作方法
INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '软科幻小说',
  'Soft Sci-Fi Novel',
  '科技不是舞台的主角，人类才是。以近未来或遥远文明为背景，探索技术跃迁如何重塑社会结构、权力关系与人的本质——当生物改造、AI统治或星际殖民成为现实，欲望、自由与身份认同将如何被重新定义。心理学、社会学、政治哲学是这个类型的灵魂，科学细节只是盛放这些问题的容器。',
  '科幻',
  'Sci-Fi',
  'zh',
  '["setting","character","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories);

-- 获取创作方法 ID
SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '软科幻小说' LIMIT 1);

-- 2. 文明设定（setting, singleton=1）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文明设定',
  'Civilization',
  '世界的物理与历史底座：时代背景、技术核心、地理范围、文明历史与核心危机',
  '{
  "type": "object",
  "x-titleField": "文明名称",
  "properties": {
    "文明名称": { "type": "string", "title": "文明名称", "useForAI": true },
    "时代背景": {
      "type": "string", "title": "时代背景",
      "enum": ["近未来（50-200年）", "中远未来（200-1000年）", "远未来（1000年以上）", "平行现实／架空历史"],
      "x-uiWidget": "select", "useForAI": true
    },
    "技术核心": {
      "type": "string", "title": "技术核心",
      "enum": ["人工智能与自动化", "基因工程与生物技术", "太空殖民与星际文明", "意识上传与数字化", "纳米技术", "能源革命与后稀缺", "复合型多技术并行"],
      "x-uiWidget": "select", "useForAI": true
    },
    "技术发展程度": { "type": "string", "title": "技术发展程度", "description": "技术达到了什么水平，主要科技突破是什么，普通人的日常生活如何", "format": "textarea", "useForAI": true },
    "地理范围": {
      "type": "string", "title": "地理范围",
      "enum": ["单一城市／区域", "国家级", "全球性", "行星级", "星际级"],
      "x-uiWidget": "select", "useForAI": true
    },
    "文明历史背景": { "type": "string", "title": "文明历史背景", "description": "重要历史事件，人类如何走到这一步，有无重大灾难或转折点", "format": "textarea", "useForAI": true },
    "文明核心危机": { "type": "string", "title": "文明核心危机", "description": "这个文明面临的根本性矛盾或正在走向的崩溃点", "format": "textarea", "useForAI": true }
  },
  "required": ["文明名称", "时代背景", "技术核心"]
}',
  @method_id,
  1, 1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 3. 社会体制（setting, singleton=1）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '社会体制',
  'Social System',
  '权力结构与阶级关系：政治形态、经济形态、阶级结构、权力核心与社会核心矛盾',
  '{
  "type": "object",
  "x-titleField": "体制名称",
  "properties": {
    "体制名称": { "type": "string", "title": "体制名称", "useForAI": true },
    "政治形态": {
      "type": "string", "title": "政治形态",
      "enum": ["技术官僚制", "企业寡头制", "AI驱动的计划管控", "民主制（变体／演化）", "威权／独裁制", "无政府／自治联邦", "神权／意识形态国家"],
      "x-uiWidget": "select", "useForAI": true
    },
    "经济形态": {
      "type": "string", "title": "经济形态",
      "enum": ["后稀缺经济（资源充裕）", "超级资本主义（极端私有化）", "AI驱动的计划经济", "双轨制（精英/底层两套系统）", "去中心化/物物交换"],
      "x-uiWidget": "select", "useForAI": true
    },
    "阶级结构": { "type": "string", "title": "阶级结构", "description": "社会阶层如何划分，阶层间是否可以流动，划分依据是什么（基因、财富、算法评分……）", "format": "textarea", "useForAI": true },
    "权力核心": { "type": "string", "title": "权力核心", "description": "谁真正掌权，通过什么机制维持权力，权力是否可见", "format": "textarea", "useForAI": true },
    "个人与集体的关系": {
      "type": "string", "title": "个人与集体的关系",
      "enum": ["极端集体主义（个体消融于集体）", "原子化个人主义（社会关系瓦解）", "被监控的「自由」（形式自由，实质管控）", "分层化（不同阶层享有不同自由度）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "社会核心矛盾": { "type": "string", "title": "社会核心矛盾", "description": "这个社会最深层的张力与冲突，会在故事中如何爆发", "format": "textarea", "x-rows": 5, "useForAI": true }
  },
  "required": ["体制名称", "政治形态", "阶级结构"]
}',
  @method_id,
  1, 1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 4. 控制与异化（setting, singleton=1）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '控制与异化',
  'Control & Alienation',
  '社会如何塑造、驯化和异化个体：控制手段、异化形式、反抗可能性与制度自洽性',
  '{
  "type": "object",
  "x-titleField": "控制体系名称",
  "properties": {
    "控制体系名称": { "type": "string", "title": "控制体系名称", "description": "给这套控制体系起一个名字或代号", "useForAI": true },
    "主要控制手段": {
      "type": "string", "title": "主要控制手段",
      "enum": ["信息管控与媒体垄断", "生物改造（药物／基因干预）", "虚拟现实与娱乐麻痹", "AI监控系统", "意识形态教育与洗脑", "经济依附与债务捆绑", "复合型控制"],
      "x-uiWidget": "select", "useForAI": true
    },
    "控制手段细节": { "type": "string", "title": "控制手段细节", "description": "控制机制的具体运作方式，人们是否知道自己被控制", "format": "textarea", "x-rows": 5, "useForAI": true },
    "主要异化形式": {
      "type": "string", "title": "主要异化形式",
      "enum": ["人性的机械化（情感被视为效率障碍）", "情感的商品化（亲密关系成为消费品）", "身份认同的消解（个体变为功能单元）", "劳动意义的失落（工作与人完全脱钩）", "自主意志的剥夺（选择权被算法取代）", "集体对个体的吞噬"],
      "x-uiWidget": "select", "useForAI": true
    },
    "异化的具体表现": { "type": "string", "title": "异化的具体表现", "description": "在日常生活、语言、情感和关系中，异化如何具体呈现", "format": "textarea", "useForAI": true },
    "反抗与逃脱的可能性": { "type": "string", "title": "反抗与逃脱的可能性", "description": "存在哪些反抗力量、地下网络或思想禁区，逃脱的代价是什么", "format": "textarea", "useForAI": true },
    "制度自洽性": { "type": "string", "title": "制度自洽性", "description": "这个体制如何让大多数人接受甚至主动维护它，制造了哪些「幸福」的幻象", "format": "textarea", "useForAI": true },
    "现实隐喻": { "type": "string", "title": "现实隐喻", "description": "这套控制与异化体系想影射什么现实社会问题", "format": "textarea", "useForAI": true }
  },
  "required": ["控制体系名称", "主要控制手段", "主要异化形式"]
}',
  @method_id,
  1, 1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 5. 故事钩子（setting, singleton=1）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '故事钩子',
  'Story Hook',
  '叙事驱动力：核心矛盾、切入事件、主角社会位置、思想主题与结局基调',
  '{
  "type": "object",
  "x-titleField": "核心矛盾",
  "properties": {
    "核心矛盾": { "type": "string", "title": "核心矛盾", "description": "驱动整个故事的根本冲突", "format": "textarea", "useForAI": true },
    "切入事件": { "type": "string", "title": "切入事件", "description": "打破现状的第一个事件——主角为何开始怀疑、反抗或改变", "format": "textarea", "useForAI": true },
    "主角社会位置": {
      "type": "string", "title": "主角社会位置",
      "enum": ["体制内精英（觉醒者）", "边缘人／异类", "底层阶级（无法向上）", "执行者／监控者（转变）", "外来者／异文化碰撞者"],
      "x-uiWidget": "select", "useForAI": true
    },
    "思想主题": { "type": "string", "title": "思想主题", "description": "本书想探讨的核心哲学、社会学或政治学问题", "format": "textarea", "useForAI": true },
    "社会寓言": { "type": "string", "title": "社会寓言", "description": "故事作为社会寓言，想对读者说什么", "format": "textarea", "useForAI": true },
    "结局基调": {
      "type": "string", "title": "结局基调",
      "enum": ["警示悲剧（以失败为代价警醒读者）", "开放结局（无明确胜负，读者自判）", "代价巨大的胜利（改变了，但失去了很多）", "有限希望（微小但真实）", "循环与无解（历史重演）"],
      "x-uiWidget": "select", "useForAI": true
    }
  },
  "required": ["核心矛盾", "思想主题"]
}',
  @method_id,
  1, 1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 6. 文风设定（setting, singleton=1）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '文风设定',
  'Writing Style',
  '叙事风格与表达方式：叙事视角、文风基调、时间尺度、技术细节呈现与意象系统',
  '{
  "type": "object",
  "x-titleField": "叙事视角",
  "properties": {
    "叙事视角": {
      "type": "string", "title": "叙事视角",
      "enum": ["第一人称（体制内叙述者）", "第三人称有限（贴身跟随主角）", "第三人称全知（史诗感）", "多视角交替（展现社会全景）"],
      "x-uiWidget": "radio", "useForAI": true
    },
    "文风基调": {
      "type": "string", "title": "文风基调",
      "enum": ["冷峻克制（奥威尔式，压抑而精准）", "讽刺荒诞（赫胥黎式，绚烂中藏腐烂）", "史诗宏大（阿西莫夫式，历史感与命运感）", "诗意感伤（末日中的人性温度）", "科技感报告体（文件感，档案体）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "时间叙事尺度": {
      "type": "string", "title": "时间叙事尺度",
      "enum": ["即时（数天到数周）", "短期（数月到一年）", "中期（数年到数十年）", "宏观（跨代际，历史进程）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "技术细节呈现方式": {
      "type": "string", "title": "技术细节呈现方式",
      "enum": ["一笔带过（科技只是背景，不解释）", "日常化嵌入（通过人物行为自然呈现）", "适度解释（必要时为读者建立认知框架）", "刻意模糊（维持神秘感和陌生感）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "意象与象征系统": { "type": "string", "title": "意象与象征系统", "description": "预计使用哪些核心意象、反复出现的符号或隐喻系统", "format": "textarea", "useForAI": true },
    "参考作品": { "type": "string", "title": "参考作品", "description": "想要对标的小说、影视或思想著作", "useForAI": true }
  },
  "required": ["叙事视角", "文风基调"]
}',
  @method_id,
  1, 1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 7. 角色（character, singleton=0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  '社会体制下的个体：阶层身份、意识形态立场、异化程度与内心冲突',
  '{
  "type": "object",
  "x-titleField": "姓名",
  "properties": {
    "姓名": { "type": "string", "title": "姓名", "useForAI": true },
    "性别": { "type": "string", "title": "性别", "enum": ["男", "女", "非二元/其他"], "x-uiWidget": "radio", "useForAI": true },
    "社会阶层与身份": { "type": "string", "title": "社会阶层与身份", "useForAI": true },
    "职业／功能角色": { "type": "string", "title": "职业／功能角色", "useForAI": true },
    "意识形态立场": {
      "type": "string", "title": "意识形态立场",
      "enum": ["体制忠实拥护者", "体制内的秘密怀疑者", "主动反抗者", "被迫异见者", "超然旁观者（看清却不行动）", "被彻底洗脑的意识形态工具人"],
      "x-uiWidget": "select", "useForAI": true
    },
    "异化程度": {
      "type": "string", "title": "异化程度",
      "enum": ["完全异化（已不自知）", "初步异化（开始觉察裂缝）", "觉醒中（痛苦挣扎）", "觉醒后（承担代价）", "未被异化（成为体制中的异数）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "个人背景": { "type": "string", "title": "个人背景", "format": "textarea", "useForAI": true },
    "与社会体制的关系": { "type": "string", "title": "与社会体制的关系", "format": "textarea", "useForAI": true },
    "核心内心冲突": { "type": "string", "title": "核心内心冲突", "format": "textarea", "useForAI": true },
    "角色弧度": { "type": "string", "title": "角色弧度", "format": "textarea", "useForAI": true }
  },
  "required": ["姓名", "意识形态立场", "异化程度"]
}',
  @method_id,
  1, 0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 8. 社会场景（scene, singleton=0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '社会场景',
  'Social Scene',
  '社会结构的具象化空间：劳动场所、控制机构、底层社区、精英空间等',
  '{
  "type": "object",
  "x-titleField": "场景名称",
  "properties": {
    "场景名称": { "type": "string", "title": "场景名称", "useForAI": true },
    "场景类型": {
      "type": "string", "title": "场景类型",
      "enum": ["生产／劳动场所", "控制机构／官方设施", "民间／底层社区", "精英阶层空间", "禁区／边界地带", "虚拟空间／数字世界", "仪式／意识形态现场"],
      "x-uiWidget": "select", "useForAI": true
    },
    "叙事功能": {
      "type": "string", "title": "叙事功能",
      "enum": ["展示社会运转逻辑", "揭示阶级差异", "体现控制手段", "呈现人性异化", "提供反抗／觉醒契机", "制造信息或戏剧冲突"],
      "x-uiWidget": "select", "useForAI": true
    },
    "物理描述": { "type": "string", "title": "物理描述", "description": "场景的布局、氛围、时间背景", "format": "textarea", "x-rows": 5, "useForAI": true },
    "社会学意义": { "type": "string", "title": "社会学意义", "description": "这个场景揭示了什么社会真相，为什么它必须存在于这个故事中", "format": "textarea", "useForAI": true },
    "关键细节": { "type": "string", "title": "关键细节", "description": "能反映时代特征、技术水平或权力关系的具体感官细节", "format": "textarea", "useForAI": true }
  },
  "required": ["场景名称", "场景类型"]
}',
  @method_id,
  1, 0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);

-- 9. 制度文物（prop, singleton=0）
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '制度文物',
  'Institutional Artifact',
  '社会隐喻的物质载体：技术产品、制度机构、符号标志、药物或文化产物',
  '{
  "type": "object",
  "x-titleField": "名称",
  "properties": {
    "名称": { "type": "string", "title": "名称", "useForAI": true },
    "物件类型": {
      "type": "string", "title": "物件类型",
      "enum": ["技术产品／设备", "制度／机构（抽象文物）", "符号／标志", "药物／生物改造物质", "虚拟产品／服务", "文化产物（艺术、语言、习俗）"],
      "x-uiWidget": "select", "useForAI": true
    },
    "表面功能": { "type": "string", "title": "表面功能", "description": "官方或表面的用途，对普通人来说它是什么", "format": "textarea", "useForAI": true },
    "真实功能与隐喻意义": { "type": "string", "title": "真实功能与隐喻意义", "description": "在社会控制或异化中的实际角色；作为社会隐喻，它象征什么", "format": "textarea", "x-rows": 5, "useForAI": true },
    "社会普及程度": {
      "type": "string", "title": "社会普及程度",
      "enum": ["全民必备（强制或事实强制）", "精英专属", "被禁止／地下流通", "已消失／被取代的旧物"],
      "x-uiWidget": "select", "useForAI": true
    },
    "与叙事的关联": { "type": "string", "title": "与叙事的关联", "description": "这件文物在故事中扮演什么角色，如何推动情节或揭示主题", "format": "textarea", "useForAI": true }
  },
  "required": ["名称", "物件类型"]
}',
  @method_id,
  1, 0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  enable_ai = VALUES(enable_ai),
  singleton = VALUES(singleton),
  entity_category = VALUES(entity_category);
