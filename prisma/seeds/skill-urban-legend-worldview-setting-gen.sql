-- 都市传说怪谈复苏流小说 - 「都市世界观」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-worldview-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-worldview-setting-gen',
  '「都市世界观」设定生成：为都市传说怪谈复苏流小说设计社会背景、事件阶段与城市异变状态',
  '"Urban Worldview" setting generation: design social backdrop, event stage, and city anomaly state for urban legend revival horror novels',
  '## 「都市世界观」设定生成 — 都市传说怪谈复苏流小说

都市世界观模块不是在描写奇幻世界——它描写的是一个「几乎和读者的现实完全一样」的现代城市，只是有一条隐藏的裂缝正在扩大。世界观设计的核心原则：**普通感越强，恐惧越深**。读者应该在描述里认出自己的城市、自己的小区、自己的日常，然后发现那里有什么不对劲。

---

### 字段生成指南

#### 城市背景
城市背景的设定精度直接影响代入感。

**精度层级建议**：

| 精度 | 示例 | 适用场景 |
|------|------|---------|
| 真实城市+模糊区域 | 「上海某市郊新建小区」 | 最高代入感，需要作者熟悉该城市 |
| 真实城市+虚构地名 | 「北京，虚构的『观音桥』地铁站」 | 代入感强，避免被指认 |
| 虚构城市+具体细节 | 「某南方沿海省份的二线城市，有城中村改造区」 | 通用性好，依靠细节建立真实感 |
| 抽象城市 | 「某个现代大都市」 | 代入感最弱，不推荐 |

**有效的细节类型**（让虚构城市变得真实的元素）：
- 交通特征：几号线地铁、末班车时间、打车等待时长
- 居住环境：老旧小区的具体描述（门卫亭、单元楼、楼道灯）
- 商业密度：便利店、外卖覆盖范围
- 社区文化：住在这里的是什么样的人

#### 时代背景
时代背景影响怪谈的传播速度和社会反应模式：

| 时代 | 传播特征 | 社会反应速度 | 典型怪谈形式 |
|------|---------|------------|------------|
| 当代（智能手机时代）| 病毒式，分钟级传播 | 极快，舆论会在12小时内形成 | 社交媒体截图、短视频证据 |
| 近未来 | 算法推送，更精准的信息茧房 | 官方控制能力更强 | AI生成的怪谈证据难以辨别真假 |
| 近过去（2000年代）| BBS/QQ群，传播较慢但难以审计 | 慢，政府反应迟钝 | 链式邮件、帖子、口耳相传 |
| 模糊时间线 | 不强调具体 | 不明确 | 适合侧重氛围的故事 |

**当代设定的特殊优势**：智能手机创造了最多的恐惧节点——消息已读不回、手机信号丢失、收到定位异常、相机快门声在不该出现的时间响起。

#### 事件阶段
事件阶段是影响主角行动空间和叙事可能性最大的变量：

**各阶段特征对比**：

```
初始阶段（大多数人不知道）
  主角处境：孤立无援，说出来没人信
  叙事优势：最大的探索空间，一切都是发现
  叙事挑战：主角为何不直接离开？需要合理的绑定原因
  适合故事类型：个人视角的日记体、私密调查

扩散阶段（少数人开始相信）
  主角处境：有少数盟友，有更多信息来源，但也有更多竞争者
  叙事优势：可以有小团体动态，信息的可靠性成为问题
  叙事挑战：为何没有更多人行动？
  适合故事类型：小团队求生，信息博弈

爆发阶段（无法再掩盖）
  主角处境：社会开始出现集体反应，有专家/官员介入
  叙事优势：可以写社会层面的失控，主角有更多信息渠道
  叙事挑战：主角特殊性减弱，需要额外的「主角才能做到」的理由
  适合故事类型：社会惊悚，规模感强

崩溃阶段（社会秩序瓦解）
  主角处境：生存资源稀缺，社会性威胁叠加怪谈威胁
  叙事优势：人性黑暗面可以充分展开
  叙事挑战：与普通末世文的区分度
  适合故事类型：末世氛围的都市怪谈，张力最大
```

#### 官方态度
官方态度影响主角的求助选项和信息渠道：

| 态度 | 叙事功能 | 对主角的影响 |
|------|---------|------------|
| 否认/封锁 | 增加孤立感，主角无处求援 | 正规渠道关闭，必须自救 |
| 不知情 | 官方也是受害者 | 可以求助但得不到有效帮助 |
| 知情但无力 | 最真实的设定之一 | 主角可以获得部分信息，但发现官方也束手无策 |
| 知情且利用 | 阴谋论加成 | 创造更大的背景威胁，适合有阴谋线的故事 |
| 主动调查 | 官方是盟友（不常见） | 主角获得资源支持，但失去部分自主性 |

#### 民间氛围
民间氛围是都市怪谈独特的叙事资源——普通人的集体反应有时比怪谈本身更恐怖：

**有趣的民间反应类型**：
- **迷信复苏**：现代人开始贴符、开光、拜神，但不知道哪个有用
- **网络自救组织**：论坛帖子、互助群，信息真假难辨
- **利用怪谈的人**：卖「防护符」的骗子，趁乱打劫的
- **恐慌性否认**：即使亲眼看见也要找理性解释
- **猎奇文化**：怪谈旅游、打卡异变地点的人
- **适应性生存**：已经摸索出一套规律的「老玩家」

#### 异变区域
异变区域是玩家可以在地图上标记的「危险地点」，也是场景模块的宏观背景：

**好的异变区域设计原则**：
- 有已知危险的区域（进去的人没出来）
- 有半已知区域（有传言但不确定）
- 有意外安全区（某些地方似乎不受影响——为什么？）
- 边界模糊（危险区域是在扩张还是收缩？）

---

### 字段联动关系

- **城市背景 → 都市场景**：城市背景的具体细节（地铁线路、小区结构）应该在具体场景模块中被充分展开
- **事件阶段 → 角色的角色定位**：「初始阶段」适合孤立的主角；「爆发阶段」适合团队作战的故事
- **官方态度 → 禁忌规则的存活方法**：如果官方在封锁消息，已知的存活方法只能来自民间
- **民间氛围 → 角色类型**：「老玩家」类角色只在扩散期之后才有存在合理性

---

### 常见错误

- ❌ 城市背景只是名字，没有具体细节——读者无法建立画面
- ❌ 事件阶段与怪谈的影响范围矛盾（影响范围是「个人诅咒」但事件阶段是「爆发」，逻辑不通）
- ❌ 官方态度是「完全不知情且完全没有反应」——现代社会的信息流速使这个设定不可信
- ❌ 民间氛围只有「恐慌」，缺乏多元性——人类面对危机的反应从来不是单一的',
  '"Urban Worldview" Setting Generation — Urban Legend Revival Horror Novels

Core principle: the more ordinary the world feels, the deeper the fear. Readers should recognize their own city in the description, then discover something is wrong.

**City backdrop precision levels**: most effective is "real city + vague district" or "real city + fictional landmark" — gives maximum immersion while avoiding identification.

**Effective detail types**: transit specifics (subway line number, last train time), housing environment (old apartment building corridor, door guard booth), commercial density, community demographics.

**Event stage decision matrix**:
- Initial (most don''t know): maximum exploration space, protagonist is isolated and disbelieved
- Spreading (some believe): small group dynamics, information reliability becomes an issue
- Outbreak (can''t be hidden): social-scale loss of control, protagonist has more information channels
- Collapse (social order breaks): survival scarcity + paranormal threat, human darkness fully expressed

**Official attitude options**: denial/suppression (protagonist isolated), unaware (official is also a victim), aware but helpless (most realistic), aware and exploiting (conspiracy layer), actively investigating (protagonist gets support but loses autonomy).

**Civilian atmosphere resources**: folk religion revival (talismans, offerings), online survival communities with unverified information, people exploiting the paranormal situation, panicked denial, curiosity tourism, "veteran survivors" who have learned the rules.

**Anomaly zones design**: must have known danger zones, semi-known zones (rumors only), and inexplicably safe zones (why?) — the unexplained safety is often more unsettling than the danger.',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  13,
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
