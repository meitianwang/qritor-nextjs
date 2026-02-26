-- -----------------------------------------------------------------------------
-- 规则类怪谈 (Rule-based Horror) 创作方法初始化 SQL
-- -----------------------------------------------------------------------------
-- 此文件包含了创建"规则类怪谈"创作方法及对应模块类型的所有 SQL 语句。
-- 包含：
--   1. novel_creation_method 记录
--   2. module_type 记录 (设定、角色、场景、规则、核心诡异、事件)
--   3. Skill (AI 辅助生成技能) 和 Prompt
-- -----------------------------------------------------------------------------

-- 设置变量
SET @method_id = 64; 
SET @method_name = '规则类怪谈';
SET @method_desc = '主打"必须遵守荒谬却致命的规则"的硬核现代灵异流派。通过逻辑冲突、认知污染和规则漏洞制造心理压迫与解谜感。';
SET @novel_type = '悬疑灵异';
SET @language = 'zh';
SET @visible_categories = '["setting", "character", "scene", "prop", "organization"]';

-- ============================================================================
-- 1. 创建创作方法
-- ============================================================================
INSERT INTO novel_creation_method 
  (id, name, description, novel_type, language, visible_categories, is_preset, status, created_at, updated_at)
VALUES
  (@method_id, @method_name, @method_desc, @novel_type, @language, @visible_categories, 1, 'active', NOW(), NOW())
ON DUPLICATE KEY UPDATE
  name = VALUES(name), description = VALUES(description), novel_type = VALUES(novel_type), 
  language = VALUES(language), visible_categories = VALUES(visible_categories), is_preset = VALUES(is_preset), status = VALUES(status), updated_at = NOW();

-- ============================================================================
-- 2. 清理旧数据（防止重复执行时冲突报错，非强制）
-- ============================================================================
-- 在插入特定的 module_type 和 skill/prompt 前不再执行大范围 DELETE，防止意外影响关联数据，使用 UPSERT （ON DUPLICATE KEY UPDATE）机制更新。

-- 为了插入新的大数据模块，我们需要一组唯一的 ID。在项目中通常由 snowflake 或类似系统生成 bigint
-- 以下预设一组临时但是比较大可能不冲突的ID:

SET @m_hook_id = 8170501600000000001;
SET @m_world_id = 8170501600000000002;
SET @m_char_id = 8170501600000000003;
SET @m_scene_id = 8170501600000000004;
SET @m_rule_id =  8170501600000000005;
SET @m_anomaly_id = 8170501600000000006;
SET @m_style_id = 8170501600000000007;

-- ============================================================================
-- 3. 创建模块类型 (Module Types)
-- ============================================================================

-- -------------------------
-- 3.1 故事钩子 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_hook_id, 
    '故事钩子', 
    '设定主角入场的原因和首个致命危机。', 
    '{"type": "object", "title": "故事钩子", "properties": {"入局方式": {"title": "入局方式", "type": "string", "enum": ["应聘高薪职位", "意外卷入", "寻找失踪者", "收到诡异信件"], "x-uiWidget": "radio", "useForAI": true}, "动机": {"title": "动机", "type": "string", "description": "主角为什么不马上逃跑的必须理由", "x-uiWidget": "textarea", "useForAI": true}, "初始异常发现": {"title": "初始异常发现", "type": "string", "description": "进入规则区域后发现的第一个不对劲的细节（如：动物园没有猴子）", "x-uiWidget": "textarea", "useForAI": true}, "首个认知冲突": {"title": "首个认知冲突", "type": "string", "description": "打破日常认知，告诉主角必须遵守规则的事件（如：不听话的同事当面变成怪形）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["入局方式", "动机", "初始异常发现"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.2 诡异世界观 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_world_id, 
    '怪谈世界观', 
    '背后隐藏的不可名状的真相或扭曲的底层逻辑。', 
    '{"type": "object", "title": "怪谈世界观", "properties": {"怪谈载体": {"title": "怪谈载体", "type": "string", "enum": ["被污染的封闭空间", "平行交叠的世界", "模因污染", "不可名状之物下放的猎场"], "x-uiWidget": "radio", "useForAI": true}, "污染源与本质": {"title": "污染源与本质", "type": "string", "description": "规则怪谈背后的终极恐怖是什么？是名为「IT」的实体？还是某种旧神？", "x-uiWidget": "textarea", "useForAI": true}, "规则的本质": {"title": "规则的本质", "type": "string", "description": "规则到底是谁制定的？是保护机制、饲养指南，还是恶意的陷阱？", "x-uiWidget": "textarea", "useForAI": true}, "生还条件": {"title": "生还条件", "type": "string", "description": "达成什么条件才能逃脱？", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["怪谈载体", "污染源与本质", "规则的本质"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.3 文风设定 (setting) - 单例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_style_id, 
    '文风设定', 
    '规则怪谈特有的冰冷、克制和精神压迫感文风。', 
    '{"type": "object", "title": "文风设定", "properties": {"语言风格": {"title": "语言风格", "type": "string", "enum": ["客观冰冷的旁观者", "充满压抑的绝望感", "神经质与自我怀疑"], "x-uiWidget": "radio", "useForAI": true}, "认知扭曲描写": {"title": "认知扭曲描写", "type": "string", "description": "当受到精神污染时，周围环境和人物在描写上要发生怎样的扭曲（例如字迹变得扭曲，对同一事物的描述前后矛盾）", "x-uiWidget": "textarea", "useForAI": true}}, "required": ["语言风格"]}',
    @method_id, 'setting', 1, 1, 1, NOW(), NOW()
);

-- -------------------------
-- 3.4 角色 (character) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_char_id, 
    '角色', 
    '被困在怪谈中的幸存者，或是已经部分异化的员工。', 
    '{"type": "object", "title": "角色", "x-titleField": "姓名", "properties": {"姓名": {"title": "姓名", "type": "string", "description": "角色的姓名或代号（代号如「蓝衣员工」）", "useForAI": true}, "角色定位": {"title": "角色定位", "type": "string", "enum": ["主角 (调查者/求生者)", "同行者 (炮灰/试错者)", "资深员工 (已被污染但仍有理智的向导)", "异化者 (已不被视为人类)"], "x-uiWidget": "select", "useForAI": true}, "身份/职业": {"title": "身份/职业", "type": "string", "description": "进入该场所的身份（如游客、保安、夜班收银员）", "useForAI": true}, "核心特质": {"title": "核心特质", "type": "string", "description": "推理能力、警觉性或是某种致命的盲目自信", "x-uiWidget": "textarea", "useForAI": true}, "视觉特征": {"title": "视觉特征", "type": "string", "description": "着装颜色极其重要（如只穿蓝衣服）", "x-uiWidget": "textarea", "useForAI": true}, "背负禁忌": {"title": "背负禁忌", "type": "string", "description": "绝对不能触犯的个人专属禁忌", "x-uiWidget": "textarea", "useForAI": true}, "称呼": {"type": "array", "title": "称呼", "description": "其他角色对当前角色的称呼记录", "items": {"type": "object", "properties": {"称呼者": {"type": "string", "title": "称呼者"}, "称呼": {"type": "string", "title": "称呼"}}, "required": ["称呼者", "称呼"]}}, "当前San值": {"title": "当前San值", "type": "string", "enum": ["理智清醒", "轻微幻觉", "严重认知扭曲", "崩溃异化边缘", "已非人类"], "x-uiWidget": "select"}, "当前健康": {"title": "当前健康", "type": "string", "enum": ["健康", "轻伤", "重伤", "肢体异化", "死亡"], "x-uiWidget": "select"}, "当前位置": {"title": "当前位置", "type": "string", "description": "角色目前所在的场景"}}, "required": ["姓名", "角色定位", "身份/职业"]}',
    @method_id, 'character', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.5 场景与规则区域 (scene) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_scene_id, 
    '规则区域(场景)', 
    '拥有独立守则和禁忌的特殊封闭空间。', 
    '{"type": "object", "title": "规则区域", "x-titleField": "区域名", "properties": {"区域名": {"title": "区域名", "type": "string", "description": "如：水族馆、404病房、夜班收银台", "useForAI": true}, "场景类型": {"title": "场景类型", "type": "string", "enum": ["安全区 (遵守规则绝对安全)", "高危区 (规则充满矛盾，随时致死)", "污染源 (怪谈核心地带)"], "x-uiWidget": "radio", "useForAI": true}, "表象特征": {"title": "表象特征", "type": "string", "description": "乍看之下正常的环境描写", "x-uiWidget": "textarea", "useForAI": true}, "异化细节": {"title": "异化细节", "type": "string", "description": "细思极恐的异常（例如：没有倒影的镜子、时间停滞的钟表、多出来的门）", "x-uiWidget": "textarea", "useForAI": true}, "专属怪物/威胁": {"title": "专属怪物/威胁", "type": "string", "description": "在这片区域潜伏的特定危险", "x-uiWidget": "textarea", "useForAI": true}, "当前开放状态": {"title": "当前开放状态", "type": "string", "enum": ["开放", "夜间封锁", "重度污染(禁止进入)"], "x-uiWidget": "select"}, "污染浓度": {"title": "污染浓度", "type": "string", "enum": ["无污染", "轻度污染", "重度污染", "无可名状"], "x-uiWidget": "select"}, "在场人员": {"title": "在场人员", "type": "string", "description": "由于规则限制，目前困在此处的人"}}, "required": ["区域名", "场景类型"]}',
    @method_id, 'scene', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.6 规则条文集 (prop / organization替代 - 暂放在 prop 分组，或者单独设为 prop 分组以供查阅) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_rule_id, 
    '纸条与守则(道具)', 
    '包含重要生存规则、矛盾信息或前人留言的载体。', 
    '{"type": "object", "title": "规则纸条", "x-titleField": "物品名称", "properties": {"物品名称": {"title": "物品名称", "type": "string", "description": "如：《动物园游客须知》、员工休息室的血字留言", "useForAI": true}, "获取方式": {"title": "获取方式", "type": "string", "description": "在哪获得的", "useForAI": true}, "物理特征": {"title": "物理特征", "type": "string", "description": "如：浸血的信纸、打印得十分正规的手册、带抓痕的便签", "x-uiWidget": "textarea", "useForAI": true}, "规则条文详情": {"title": "规则条文详情", "type": "string", "description": "具体写了什么规则（列出1-5条具体内容）", "x-uiWidget": "textarea", "useForAI": true}, "真伪与矛盾点": {"title": "真伪与矛盾点", "type": "string", "description": "这是一份真规则、被污染的假规则，还是带陷阱的半真半假？它的矛盾点在哪里？", "x-uiWidget": "textarea", "useForAI": true}, "当前持有者": {"title": "当前持有者", "type": "string"}, "污染刻度": {"title": "污染刻度", "type": "string", "description": "这张纸条本身是否会带来精神污染？"}}, "required": ["物品名称", "规则条文详情", "真伪与矛盾点"]}',
    @method_id, 'prop', 1, 0, 1, NOW(), NOW()
);

-- -------------------------
-- 3.7 诡异实体 (organization，复用为不可名状的势力或怪形归属) - 多例
-- -------------------------
INSERT INTO module_type (id, name, description, json_schema, novel_creation_method_id, entity_category, enable_ai, singleton, built_in, created_at, updated_at)
VALUES (
    @m_anomaly_id, 
    '诡异实体阵营', 
    '怪谈世界中游荡的不可名状的势力、怪形或组织系统。', 
    '{"type": "object", "title": "诡异阵营", "x-titleField": "名称", "properties": {"名称": {"title": "名称", "type": "string", "description": "如：兔子血肉（它）、穿黑衣的员工、夜班管理层", "useForAI": true}, "类型": {"title": "类型", "type": "string", "enum": ["不可名状的恐怖源头", "被污染的堕落者阵营", "维持表面秩序的系统", "对立的未知怪形"], "x-uiWidget": "select", "useForAI": true}, "行为模式": {"title": "行为模式", "type": "string", "description": "它们如何狩猎或影响人类", "x-uiWidget": "textarea", "useForAI": true}, "识别特征": {"title": "识别特征", "type": "string", "description": "一旦发现什么征兆说明它们出现了（如：听到笑声、看到长颈鹿长出象牙）", "x-uiWidget": "textarea", "useForAI": true}, "应对法则": {"title": "应对法则", "type": "string", "description": "遇到它们时，幸存者应该怎么办", "x-uiWidget": "textarea", "useForAI": true}, "当前威胁等级": {"title": "当前威胁等级", "type": "string", "enum": ["未知", "低度", "高度", "立刻秒杀"], "x-uiWidget": "select"}}, "required": ["名称", "类型", "行为模式"]}',
    @method_id, 'organization', 1, 0, 1, NOW(), NOW()
);

-- ============================================================================
-- SQL Seed 完成
-- 领域知识 (Skills) 的注入由单独的 Skill SQL 脚本负责管理
-- ============================================================================
