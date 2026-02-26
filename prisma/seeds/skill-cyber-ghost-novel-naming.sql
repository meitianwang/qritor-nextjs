-- 智慧社区灵异「小说命名」技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyber-ghost-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyber-ghost-novel-naming',
  '智慧社区灵异小说命名：书名应呈现「技术词汇承载异常含义」的赛博灵异美学——用最冷静的技术语言描述最令人不安的事情',
  'Cyber-paranormal novel naming: titles should present the aesthetic of "technical vocabulary carrying paranormal meaning" — describe the most unsettling things in the calmest technical language',
  '## 小说命名 — 智慧社区灵异小说创作

赛博灵异书名的核心美学是**反差**：用冷静、技术性、日常的语言包裹异常和恐惧。一个让人不安的书名不应该直接说「鬼来了」，而应该是一行错误日志、一条设备通知、一个找不到技术解释的状态码。

---

### 书名美学：技术词汇的异化

**核心原则**：书名应该看起来像是从设备系统日志、App 通知、物业公告或技术文档里截取出来的一行文字——但放在小说语境里，这行文字产生了不同的含义。

**最强书名类型**：

#### 类型一：设备状态描述型
将设备的异常状态直接作为书名，不加任何解释：

- 「摄像头离线：3:17:42 至 3:24:09」
- 「扫地机器人不清扫 B6 区域」
- 「音箱在未被唤醒的情况下响应了」
- 「本设备已检测到 1 名访客，但门禁日志显示无人进出」
- 「运动传感器：持续触发，持续七天，凌晨三时」

**美学解析**：这类书名像是一条平静的系统提示，但读完之后，读者会意识到这条提示描述的是一件技术上不可能发生的事。冷静与不安之间的反差就是书名的张力来源。

#### 类型二：技术日志格式型
用日志格式（时间戳 + 事件描述）命名：

- 「2024/03/15 03:17 未知来源触发门铃」
- 「ERROR: 摄像头画面与环境光传感器数据不一致」
- 「上次清扫：从未/上次检测到的区域：卧室角落」

**美学解析**：日志格式给书名增加了精确性和客观性，但「未知来源」「从未」这类词出现在技术日志里，会产生一种机器在报告它无法理解的事情的不安感。

#### 类型三：悖论性技术声明型
用技术语言陈述一个逻辑悖论：

- 「此摄像头覆盖范围内没有盲区」（但录像里有些东西出现在盲区之外）
- 「没有人进入过这个房间」（但房间里的东西被移动了）
- 「所有设备运行正常」（故事的整个内容都在证明这是错的）

**美学解析**：用技术确定性的语言包裹一个不可能成立的声明，读者的不安来自于「这句话本身就在说谎」的意识。

#### 类型四：普通日常型（低调版）
看起来完全普通，但放在灵异小说语境里有另一层含义：

- 「我家的摄像头」
- 「3206 房间」
- 「智慧社区」
- 「夜间模式」
- 「离线存储」

**美学解析**：极度普通的书名让读者低估了故事内容，进入故事后形成落差——这也是赛博灵异「日常的不对劲」美学在书名层面的体现。

---

### 书名词库

**技术词汇层**（设备/系统类）：
- 摄像头、门铃、音箱、传感器、监控
- 日志、记录、历史、备份、覆盖
- 固件、更新、重启、离线、在线
- 延迟、误报、触发、检测、识别
- 盲区、覆盖范围、存储周期
- 门禁、物业、监控室、主机
- 热力图、轨迹、禁区

**时间词汇层**（制造精确感的时间描述）：
- 凌晨三时/3:17/7 天/连续
- 上次/从未/每次/第一次
- 已删除/已覆盖/已过期

**状态词汇层**（技术状态 + 异常含义）：
- 异常/未知/错误/无法识别
- 离线但仍在运行/触发但无人
- 不一致/冲突/矛盾

---

### 简介结构

赛博灵异小说简介应在三段以内完成三件事：

**第一段：建立日常与技术依赖**
用一到两句话描述主角的日常环境和对智慧家居的依赖——让读者感受到这是一个理性的、可控的世界。

**第二段：引入第一个异常（技术性描述）**
用最客观、最技术性的语言描述第一个异常——不要渲染，不要解释，就是陈述事实。「那天晚上，摄像头记录显示，在主角身后站着一个人。但主角回头时，那里什么都没有。」

**第三段：核心问题（不要给答案）**
提出故事的核心叙事问题，但不要回答它。「设备不会撒谎。但如果设备记录到的东西不可能存在，那意味着什么？」

**简介禁止事项**：
- 不要泄露异常的「原因」（无论是鬼/灵异力量/超自然现象，都不要在简介里说明）
- 不要使用「恐惧」「害怕」「吓到」等直接情绪词汇
- 不要说「主角发现了一个秘密」——赛博灵异的核心是「无法确认/无法证明」，而不是发现秘密

---

### 书名一致性检查

- 书名的风格是否与故事的叙事调性一致？（冷静技术型书名配得上故事的技术性叙事）
- 书名是否包含故事中真实出现的设备或情节？（不要用故事里没有出现的设备作为书名的核心词）
- 书名是否在不剧透的前提下传达了故事的核心张力？',
  'Cyber-paranormal novel naming: titles should present the aesthetic of "technical vocabulary carrying paranormal meaning" — describe the most unsettling things in the calmest technical language',
  (SELECT id FROM novel_creation_method WHERE name = '智慧社区灵异小说创作' LIMIT 1),
  1,
  35,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order);
