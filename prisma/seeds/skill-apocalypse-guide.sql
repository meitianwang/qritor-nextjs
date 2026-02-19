-- 末世天灾囤货流创作方法专属 Skill / Post-Apocalyptic Hoarding Genre Guide Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-apocalypse-guide.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'apocalypse-guide',
  '末世天灾囤货流创作指南：涵盖天灾档案递进设计、物资经济体系、避难所基地建设、角色生存技能与道德阵营分化、动态信息追踪（isDynamic）机制、囤货清单逻辑、人性博弈与末世叙事结构',
  'Post-apocalyptic hoarding genre writing guide: covers disaster archive escalation design, resource economy system, shelter base-building, character survival skills and moral alignment divergence, dynamic info tracking (isDynamic) mechanics, hoarding checklist logic, human nature dilemmas, and apocalypse narrative structure',
  '## 末世天灾囤货流创作指南

本指南专为「末世天灾囤货流」创作方法提供写作指导。这是一个极具特色的末世生存类型：核心不是打怪升级，而是**预知灾难→疯狂囤货→灾难降临→资源博弈→人性考验**。读者的爽点来自"提前准备的优越感"和"物资管理的策略性"。

---

### 一、类型特征与核心魅力

#### 1.1 什么是末世囤货流

末世囤货流区别于其他末世文（丧尸流、异能流、废土流）的关键在于：

| 特征 | 说明 |
|------|------|
| **预知优势** | 主角通过重生/预言/系统等方式提前得知天灾降临 |
| **囤货阶段** | 故事前期大量篇幅用于采购、储备、选址 |
| **天灾为主** | 威胁来源是自然灾害（极寒/洪涝/酸雨等），而非丧尸或怪物 |
| **资源驱动** | 物资的有无直接决定生死，是核心矛盾来源 |
| **基地建设** | 避难所的搭建、升级、防御是叙事骨架 |
| **人际博弈** | 人与人之间因物资分配产生的信任危机和道德冲突 |

#### 1.2 读者核心爽点

- **囤货清单的满足感**：看主角一车一车地往仓库搬物资
- **先知优势的优越感**：别人还在逛街时主角已经在囤罐头和发电机
- **物资稀缺的紧迫感**：灾后每一瓶水、每一颗药都可能救命
- **基地升级的成就感**：从简陋小屋到固若金汤的避难所
- **人性博弈的代入感**：该不该救陌生人？物资够分吗？

---

### 二、非标准实体类别系统

**本创作方法与其他方法完全不同**——它使用了一套自定义的实体类别，没有标准的 setting、scene、organization、prop 类别。

#### 2.1 可用类别（visible_categories）

| 类别 | 对应实体 | 说明 |
|------|---------|------|
| **character** | 角色档案 | 生存者、敌对者、NPC |
| **item** | 重要物资 | 食物、武器、工具、材料等 |
| **facility** | 避难所信息 | 基地设施（singleton） |
| **event** | 天灾档案 | 各类天灾记录 |
| **faction** | 势力/团体 | 幸存者组织、敌对势力等 |
| **chapter** | 章节 | 章节规划 |

**注意**：本方法没有 setting（世界观由天灾档案+避难所隐含定义）、没有 scene（场景融入天灾和避难所描写中）、没有 organization（由 faction 替代）、没有 prop（由 item 替代）。这是本方法最独特的设计——所有世界观信息分散在四类实体档案中。

#### 2.2 isDynamic 动态字段机制

本方法有一个关键概念：**部分字段标记为 isDynamic=true**，表示该字段的值会随故事进展而变化。

| 实体 | 动态字段 | 变化含义 |
|------|---------|---------|
| 天灾档案 | Phase（灾难阶段） | 前兆期→爆发期→持续期→消退期 |
| 避难所信息 | SuppliesStatus（物资状态） | 充足→紧张→匮乏→耗尽 |
| 重要物资 | Quantity（数量） | 随消耗/获取而增减 |

**动态字段的叙事意义**：
- 它们是**时间线标记器**——通过 Phase 的变化可以看出故事进展到哪个阶段
- 它们是**张力制造器**——Quantity 从 100 降到 5 的过程就是紧张感的来源
- 它们是**决策触发器**——SuppliesStatus 变为"匮乏"时，角色必须做出艰难抉择

在创作过程中，应当在关键剧情节点更新这些动态字段，让它们反映故事的真实状态。

---

### 三、天灾档案设计（event 类别）

天灾档案是本方法的核心驱动力。每一场天灾都是一个非 singleton 实体，可以创建多个。

#### 3.1 字段说明

| 字段 | 说明 | 设计要点 |
|------|------|---------|
| EventName | 灾难名称 | 具体且有画面感："第一次极寒浪潮"、"酸雨季" |
| Type | 灾难类型 | 极寒/极热/洪涝/酸雨/虫灾/地震/尸潮/瘟疫 |
| Phase | 灾难阶段（isDynamic） | 前兆期→爆发期→持续期→消退期，需随剧情更新 |
| Impact | 环境影响 | 具体描述对环境、生态、人类活动的影响 |

#### 3.2 天灾类型设计矩阵

每种 Type 有不同的叙事功能和物资需求：

| Type | 核心威胁 | 关键物资需求 | 叙事功能 |
|------|---------|-------------|---------|
| **极寒** | 冻死、取暖困难 | 燃料、保暖衣物、食物热量 | 困守基地、考验储备 |
| **极热** | 中暑、水源蒸发 | 水、制冷设备、遮阳材料 | 水资源争夺战 |
| **洪涝** | 淹没、疾病、交通断绝 | 高地、船只、净水设备 | 迫使迁移、分离角色 |
| **酸雨** | 腐蚀、空气污染 | 防护服、密封材料、室内农业 | 限制户外活动、困境感 |
| **虫灾** | 农作物毁灭、疾病传播 | 杀虫剂、密封粮仓、医疗用品 | 食物危机的催化剂 |
| **地震** | 建筑倒塌、地形改变 | 建材、工具、应急医疗 | 摧毁基地、重建叙事 |
| **尸潮** | 直接人身威胁 | 武器、防御工事、弹药 | 战斗场景、牺牲与英雄主义 |
| **瘟疫** | 传染死亡、隔离 | 医药、隔离设施、防护装备 | 信任危机、要不要接纳外人 |

#### 3.3 天灾递进设计原则

**核心原则：天灾必须递进，不能平铺**。

推荐的递进模式：
```
第一灾（单一型）：极寒或极热 → 检验基本储备
第二灾（叠加型）：酸雨+虫灾 → 户外活动受限+食物危机
第三灾（升级型）：地震 → 摧毁现有基地，迫使重建
第四灾（复合型）：瘟疫+尸潮 → 内外夹击，最终考验
```

**递进维度**：
1. **强度递进**：每次天灾比上一次更严重
2. **类型叠加**：多种天灾同时或连续出现
3. **覆盖范围扩大**：从局部到全域
4. **恢复期缩短**：还没喘过气下一灾就来了

#### 3.4 Phase 动态管理

Phase 字段是 isDynamic 的，需要随故事推进更新：

| Phase | 叙事功能 | 典型事件 |
|-------|---------|---------|
| **前兆期** | 制造紧张、最后的准备窗口 | 异常天象、动物迁徙、温度骤变 |
| **爆发期** | 高潮、生存危机 | 灾难正面袭来、第一批伤亡 |
| **持续期** | 消耗战、人际矛盾激化 | 物资持续消耗、士气下降、叛逃者出现 |
| **消退期** | 短暂喘息、评估损失 | 清点物资、修复设施、决定下一步 |

**关键**：在创作中，当某场天灾从爆发期转入持续期时，应更新该天灾档案的 Phase 字段。这样可以实时追踪每场灾难的进展状态。

---

### 四、重要物资系统（item 类别）

物资是囤货流的灵魂。每一件重要物资都是一个非 singleton 实体。

#### 4.1 字段说明

| 字段 | 说明 | 设计要点 |
|------|------|---------|
| ItemName | 物资名称 | 具体物品名，如"军用压缩饼干"、"便携净水器" |
| Category | 物资分类 | 食物水/医疗/武器/工具/材料燃料/奢侈品 |
| Rarity | 稀缺度 | 随处可见→常见→不太常见→稀有→极稀有→绝版 |
| Quantity | 数量（isDynamic） | 需随消耗和获取而更新 |
| Description | 物资描述 | 功能、保质期、使用场景 |

#### 4.2 物资分类策略

| Category | 囤货优先级 | 核心物资举例 | 叙事功能 |
|----------|-----------|-------------|---------|
| **食物水** | 最高 | 压缩饼干、纯净水、罐头、米面 | 基本生存保障，消耗最快 |
| **医疗** | 极高 | 抗生素、止血带、退烧药、手术器械 | 伤病情节的关键道具 |
| **武器** | 高 | 弩弓、砍刀、防暴盾、信号枪 | 对抗人类威胁和尸潮 |
| **工具** | 高 | 发电机、太阳能板、对讲机、工具箱 | 基地建设和维护 |
| **材料燃料** | 中高 | 汽油、水泥、钢板、木材、煤炭 | 基地升级和取暖 |
| **奢侈品** | 低（但重要） | 烟酒、巧克力、书籍、种子 | 交易货币、士气维持 |

#### 4.3 Rarity 稀缺度经济

灾前和灾后的 Rarity 完全不同——这是制造戏剧张力的关键：

| 物资 | 灾前 Rarity | 灾后 Rarity | 叙事张力 |
|------|------------|------------|---------|
| 纯净水 | 随处可见 | 稀有 | 最不起眼的东西变成了最珍贵的 |
| 抗生素 | 常见 | 极稀有 | 一盒药可以换一车粮食 |
| 食盐 | 随处可见 | 不太常见 | 文明崩塌从调味品开始 |
| 枪支弹药 | 极稀有 | 绝版 | 谁有武器谁就是规则制定者 |
| 种子 | 常见 | 极稀有 | 短期无用但长期价值无限 |
| 烟酒 | 常见 | 稀有 | 变成末世硬通货 |

#### 4.4 Quantity 动态追踪

Quantity 是 isDynamic 字段，需要在关键节点更新：

**更新时机**：
- 大量消耗后（一场天灾结束后清点库存）
- 获得新物资后（搜刮、交易、生产）
- 物资损失后（被劫、被灾害毁坏、过期变质）

**Quantity 变化的叙事效果**：
```
Quantity: 500瓶 → 故事开始，安全感
Quantity: 200瓶 → 消耗明显，开始紧张
Quantity: 50瓶 → 必须外出搜刮或交易
Quantity: 10瓶 → 生存危机，必须做出牺牲
Quantity: 0 → 绝境，最高张力
```

#### 4.5 囤货清单设计原则

**写实性**：
- 标注具体重量/体积（"50斤大米"而非"很多大米"）
- 考虑存储条件（冷藏/干燥/密封）
- 标注保质期（罐头3年、药品2年、汽油半年）
- 计算消耗速度（4人每天消耗2升水=30天需要240升）

**合理性**：
- 主角的经济能力决定囤货上限（月薪5000不可能囤100万的物资）
- 运输和存储空间是硬限制（一辆面包车能装多少？）
- 保质期是时间炸弹（过期物资=无效物资）

**戏剧性**：
- 总有一类关键物资是遗漏的（囤了食物忘了药、囤了武器没有弹药）
- 某些物资的价值在灾后才显现（种子、盐、打火石）
- 物资分配是制造人际冲突的最佳工具

---

### 五、避难所信息（facility 类别）

避难所是 singleton 实体——整个故事只有一个"大本营"。

#### 5.1 字段说明

| 字段 | 说明 | 设计要点 |
|------|------|---------|
| ShelterName | 避难所名称 | 有辨识度的名字，如"地下堡垒"、"山谷营地" |
| Location | 地理位置 | 具体到地形特征，关系到防御和资源获取 |
| DefenseLevel | 防御等级（1-10） | 反映基地的安全程度 |
| Facilities | 设施列表（array） | 当前拥有的功能设施 |
| SuppliesStatus | 物资状态（isDynamic） | 充足/紧张/匮乏/耗尽 |

#### 5.2 Location 选址逻辑

避难所选址是故事早期的重要决策，直接影响后续所有剧情：

| 选址类型 | 优势 | 劣势 | 适合的天灾 |
|---------|------|------|-----------|
| **地下室/地下工程** | 温度稳定、防辐射 | 通风差、易积水 | 极寒、极热、酸雨 |
| **山区高地** | 不怕洪涝、视野好 | 交通不便、物资运输难 | 洪涝、尸潮 |
| **废弃军事设施** | 防御强、存储空间大 | 可能被其他势力觊觎 | 全类型 |
| **偏远农村** | 人少资源争夺小、可种植 | 医疗设施差、孤立 | 瘟疫、虫灾 |

#### 5.3 DefenseLevel 递进路径

DefenseLevel 从低到高的升级路径就是基地建设的叙事线：

```
1-2 级：简易遮蔽（帐篷/废弃房屋）→ 能挡风雨
3-4 级：基本加固（门窗加固、简易围栏）→ 能挡小股入侵
5-6 级：中等防御（围墙、瞭望塔、陷阱）→ 能抵御中等威胁
7-8 级：坚固堡垒（钢筋混凝土、发电系统、监控）→ 能抵御大规模进攻
9-10级：要塞级别（多重防线、武器库、自给自足系统）→ 几乎无法攻破
```

**设计建议**：
- 故事开始时 DefenseLevel 在 1-3
- 中期升到 5-6，给主角成就感
- 大灾来袭时跌回 3-4（地震摧毁），制造危机
- 最终达到 7-8，但永远不要到 10（满级=无趣）

#### 5.4 Facilities 升级路径

Facilities 是 array 字段，代表避难所当前拥有的功能设施：

| 阶段 | 示例设施 | 解锁条件 |
|------|---------|---------|
| **初期** | 储水桶、简易灶台、睡袋 | 基本物资 |
| **发展期** | 发电机、简易医疗室、菜园 | 工具+材料+人手 |
| **成熟期** | 太阳能系统、无线电台、温室大棚 | 专业技能+稀缺物资 |
| **巅峰期** | 净水系统、武器工坊、地下仓库 | 大量材料+团队合作 |

#### 5.5 SuppliesStatus 动态管理

SuppliesStatus 是 isDynamic 字段，反映避难所的整体物资健康度：

| 状态 | 含义 | 触发事件 |
|------|------|---------|
| **充足** | 储备丰富，短期无忧 | 大量囤货后、成功搜刮后 |
| **紧张** | 消耗加快，需要计划 | 人口增加、天灾持续期 |
| **匮乏** | 某类关键物资即将耗尽 | 长期围困、物资被劫 |
| **耗尽** | 面临断粮/断水/断药 | 极端灾害、多灾叠加 |

---

### 六、角色档案设计（character 类别）

#### 6.1 字段说明

| 字段 | 说明 | 设计要点 |
|------|------|---------|
| Name | 角色姓名 | 简洁好记 |
| Identity | 身份/职业 | 灾前职业，决定生存技能基础 |
| Personality | 性格特征 | 影响末世中的决策倾向 |
| SurvivalSkill | 生存技能（array） | 角色能贡献什么（战斗/医疗/建造/种植等） |
| MoralAlignment | 道德阵营 | 守序善良/中立善良/混乱善良/守序中立/绝对中立/混乱中立/守序邪恶/中立邪恶/混乱邪恶 |

#### 6.2 SurvivalSkill 设计

SurvivalSkill 是 array 字段，每个角色可以有多个生存技能。技能设计应遵循：

**技能来源于 Identity**：
- 退伍军人 → [近身格斗, 射击, 野外求生, 战术指挥]
- 医生 → [外科手术, 药物配制, 疾病诊断]
- 建筑工人 → [建筑施工, 电气维修, 焊接]
- 农民 → [种植, 畜牧, 气象观测, 野菜辨识]
- 厨师 → [食物加工, 食材保存, 营养搭配]

**团队互补原则**：
- 主角团的 SurvivalSkill 应该互补，不要人人都会打架
- 缺少某类技能=叙事张力（没有医生时有人受伤怎么办？）
- 新角色加入团队的理由往往是"我们需要他的技能"

#### 6.3 MoralAlignment 道德阵营系统

MoralAlignment 是本方法角色设计的核心维度。九宫格阵营在末世背景下有独特的含义：

| 阵营 | 末世表现 | 典型行为 |
|------|---------|---------|
| **守序善良** | 坚持规则和道德底线 | 即使物资紧张也要公平分配，收留难民 |
| **中立善良** | 好人，但灵活变通 | 愿意帮助别人，但不会愚蠢地牺牲自己 |
| **混乱善良** | 不守规则但心地善良 | 偷敌人的物资分给难民 |
| **守序中立** | 规则至上 | 定了物资分配制度就严格执行，无论谁求情 |
| **绝对中立** | 随机应变 | 看情况决定帮不帮，不预设立场 |
| **混乱中立** | 只管自己 | 不主动害人但也不帮人，独行侠 |
| **守序邪恶** | 利用规则谋私利 | 建立独裁统治，用制度压榨他人 |
| **中立邪恶** | 自私且不择手段 | 为了自己的物资可以出卖盟友 |
| **混乱邪恶** | 纯粹的破坏者 | 抢劫、杀人、以毁灭为乐 |

**MoralAlignment 的叙事运用**：
1. **阵营转变是最好的角色弧光**：守序善良的人在极端压力下滑向中立甚至邪恶
2. **阵营冲突是最佳矛盾来源**：守序善良vs守序邪恶——同样信奉规则但目的完全不同
3. **末世是阵营的试炼场**：灾前的"好人"在末世未必是好人，灾前的"混混"可能成为英雄
4. **主角团内部阵营差异**：有人想救所有人，有人只想保护自己人——这种分歧驱动情节

---

### 七、叙事结构：末世八幕式

末世囤货流有独特的八幕叙事结构，每一幕对应不同的叙事重心：

#### 第一幕：预知灾难（~8%）

主角获得灾难预知（重生/系统/异梦），确认天灾即将降临。

**要点**：
- 预知来源要合理且有限制（不能什么都知道）
- 主角的初始反应要真实（怀疑→验证→接受→恐慌→冷静→行动）
- 时间压力：距离第一灾还有多久？

#### 第二幕：疯狂囤货（~15%）

**这是囤货流最核心的爽文阶段**。主角利用预知开始大规模采购。

**要点**：
- 囤货过程要有细节感（去哪买、买什么、多少钱、怎么运、存在哪）
- 要有阻碍（钱不够、货被抢、引起怀疑）
- 这个阶段建立主要物资实体，填写 ItemName、Category、Rarity、Quantity、Description
- 避难所在此阶段选定并开始基础建设

#### 第三幕：灾难降临（~10%）

第一场天灾正式到来。创建第一个天灾档案实体。

**要点**：
- Phase 从前兆期开始，逐步推进到爆发期
- 灾难的视觉冲击要够强（读者第一次看到天灾的震撼感）
- 社会秩序开始崩塌（商店被抢、交通瘫痪、通讯中断）
- 主角此时的优势开始显现（我有准备！）

#### 第四幕：初期生存（~15%）

在第一场天灾中挣扎求生，适应末世规则。

**要点**：
- 主角用囤积的物资解决实际问题（爽点）
- 但也要遇到预料之外的困难（物资某方面不足、新的威胁）
- Quantity 开始下降，SuppliesStatus 从"充足"向"紧张"过渡
- 开始收留其他幸存者，团队初步成形

#### 第五幕：建立基地（~15%）

避难所从简陋住所升级为功能完备的基地。

**要点**：
- Facilities 逐步增加，DefenseLevel 稳步上升
- 每个设施的建设都需要特定物资和技能（与 item 和 character 的 SurvivalSkill 关联）
- 基地建设过程是展示角色 SurvivalSkill 的最佳舞台
- 第一场天灾进入消退期，Phase 更新

#### 第六幕：人际冲突（~15%）

物资分配问题引发内部矛盾，外部势力开始觊觎。

**要点**：
- MoralAlignment 差异导致的分歧正式爆发
- 外部势力（faction）登场——可能是其他幸存者团体
- 第二场天灾叠加，压力骤增
- SuppliesStatus 可能降至"匮乏"
- 最大的敌人往往不是天灾而是人

#### 第七幕：扩展势力（~12%）

主角团开始向外扩张，建立贸易网络或吞并其他势力。

**要点**：
- 物资交易体系建立（奢侈品成为硬通货）
- 角色团队 SurvivalSkill 的综合运用
- 第三场天灾来袭（更强、更复杂）
- DefenseLevel 遭受考验后再次提升

#### 第八幕：终极天灾（~10%）

最终也是最严重的天灾（通常是多灾复合），对主角团发起终极考验。

**要点**：
- 所有之前的物资储备、基地建设、人际关系在此刻接受总检验
- Phase 从前兆期一路推到爆发期的高潮
- Quantity 降到最低，SuppliesStatus 接近"耗尽"
- 需要做出最艰难的道德抉择
- 结局：灾后重建的希望（种子发芽、孩子出生、无线电收到信号）

---

### 八、资源管理作为情节驱动

#### 8.1 稀缺创造冲突

物资稀缺是末世故事中最自然的冲突来源：

| 稀缺场景 | 产生的冲突 | 情节走向 |
|---------|-----------|---------|
| 水源不足 | 是否接纳新成员？ | 道德困境+可能的叛变 |
| 药品耗尽 | 有伤员但无药可用 | 冒险外出搜刮 or 放弃治疗 |
| 食物见底 | 分配比例争议 | 内部分裂 or 集体突围 |
| 燃料告罄 | 发电机停转、供暖中断 | 技术替代方案 or 迁移基地 |
| 武器不足 | 防御漏洞 | 智取代替力夺 or 外交谈判 |

#### 8.2 丰裕制造麻痹

反过来，物资充足同样可以制造戏剧性：
- 物资丰富→安全感→警惕性下降→被突袭
- 物资丰富→引来觊觎→被围攻
- 物资丰富→内部争权→谁来分配？谁做老大？
- 物资丰富→对外慈善→道德绑架（为什么给他们不给我们？）

---

### 九、人性探索：极端条件下的道德困境

#### 9.1 经典道德困境模板

| 困境 | 选择A | 选择B | 张力来源 |
|------|-------|-------|---------|
| 救还是不救 | 收留伤者（消耗物资） | 拒之门外（保存物资） | 善良vs生存 |
| 分还是不分 | 与邻居共享存粮 | 独享确保自家安全 | 利他vs利己 |
| 杀还是不杀 | 处死偷盗者以儆效尤 | 宽恕但可能再犯 | 秩序vs宽容 |
| 走还是留 | 放弃基地转移 | 死守但可能全灭 | 理性vs感情 |
| 真话还是假话 | 告诉众人物资快尽了 | 隐瞒以维持士气 | 透明vs稳定 |

#### 9.2 阵营转变弧光

最好的角色弧光是 MoralAlignment 的变化轨迹：
- **堕落弧**：守序善良→绝对中立→守序邪恶（好人被现实磨成了独裁者）
- **救赎弧**：混乱中立→混乱善良→中立善良（独行侠学会了为他人而战）
- **坚守弧**：守序善良→守序善良（在所有考验后依然选择善良，最动人）
- **崩塌弧**：中立善良→中立邪恶→混乱邪恶（好人彻底黑化，最令人唏嘘）

---

### 十、常见陷阱

| 陷阱 | 问题 | 正确做法 |
|------|------|---------|
| **物资不合理** | 月薪五千却囤了价值百万的物资 | 严格限制经济能力和运输能力 |
| **天灾没有递进** | 每次天灾强度差不多 | 严格遵循递进原则，每次更强/更复杂 |
| **主角太顺利** | 什么都有、什么都会、每次都赢 | 制造关键遗漏和意外损失 |
| **物资只减不增** | 一直在消耗却没有补充途径 | 设计搜刮、交易、生产三条补充线 |
| **人际冲突脸谱化** | 坏人就是坏、好人就是好 | 用 MoralAlignment 体现灰度 |
| **忽略时间线** | Phase/Quantity 不变化 | 利用 isDynamic 字段追踪时间进展 |
| **基地建设流水账** | 枯燥地罗列设施升级 | 每次升级都与具体困难/冲突绑定 |
| **忽视保质期** | 囤了十年都不坏 | 食物/药品/燃料都有保质期限制 |
| **末世太快恢复** | 几个月就重建文明 | 末世的核心是"长期无序"的压迫感 |

---

### 十一、创作检查清单

开始写作前确认：

- [ ] 天灾档案是否设计了至少 3 场递进式灾难（Type 不重复或递进叠加）
- [ ] 重要物资是否涵盖了六大 Category（食物水/医疗/武器/工具/材料燃料/奢侈品）
- [ ] 主角的经济能力和囤货量是否匹配合理
- [ ] 避难所的 Location 选址是否有战略逻辑
- [ ] 角色团队的 SurvivalSkill 是否互补
- [ ] 角色的 MoralAlignment 是否有足够的差异性以制造冲突
- [ ] isDynamic 字段（Phase/SuppliesStatus/Quantity）是否有计划在关键节点更新
- [ ] 是否设计了至少 2 个重大道德困境
- [ ] 物资消耗速度和保质期是否经过基本计算
- [ ] 天灾的 Impact 是否具体到影响哪些物资和设施',
  '## Post-Apocalyptic Hoarding Genre Writing Guide

This guide provides dedicated writing instructions for the "Post-Apocalyptic Hoarding Genre" (末世天灾囤货流) creation method. This is a distinctive survival subgenre: the core is not monster-slaying or power-leveling, but **foreknowledge of disaster -> frantic hoarding -> catastrophe strikes -> resource warfare -> tests of human nature**. Reader satisfaction comes from "the superiority of being prepared" and "the strategy of resource management."

---

### I. Genre Characteristics and Core Appeal

#### 1.1 What Is the Hoarding Genre

The hoarding genre differs from other post-apocalyptic fiction (zombie, superpower, wasteland) in these key ways:

| Feature | Description |
|---------|-------------|
| **Foreknowledge advantage** | The protagonist learns about incoming disasters via rebirth/prophecy/system |
| **Hoarding phase** | Significant early story space devoted to procurement, stockpiling, site selection |
| **Natural disasters as primary threat** | The danger comes from natural catastrophes (extreme cold/floods/acid rain), not zombies or monsters |
| **Resource-driven** | Having or lacking supplies directly determines life and death—the core source of conflict |
| **Base-building** | Shelter construction, upgrades, and defense form the narrative backbone |
| **Interpersonal dynamics** | Trust crises and moral conflicts arising from resource distribution among people |

#### 1.2 Core Reader Satisfactions

- **Hoarding checklist gratification**: Watching the protagonist load supplies truck by truck into storage
- **Foreknowledge superiority**: While others are shopping, the protagonist is already stockpiling canned food and generators
- **Scarcity urgency**: Post-disaster, every bottle of water and every pill could save a life
- **Base upgrade progression**: From a crude shelter to an impregnable haven
- **Human nature dilemmas**: Should you save strangers? Are there enough supplies to share?

---

### II. Non-Standard Entity Category System

**This creation method is fundamentally different from all others**—it uses a custom set of entity categories. There are no standard setting, scene, organization, or prop categories.

#### 2.1 Available Categories (visible_categories)

| Category | Corresponding Entity | Purpose |
|----------|---------------------|---------|
| **character** | Character Archive (角色档案) | Survivors, antagonists, NPCs |
| **item** | Critical Supplies (重要物资) | Food, weapons, tools, materials |
| **facility** | Shelter Info (避难所信息) | Base facilities (singleton) |
| **event** | Disaster Archive (天灾档案) | Records of each catastrophe |
| **faction** | Factions/Groups | Survivor organizations, hostile groups |
| **chapter** | Chapters | Chapter planning |

**Note**: This method has no setting (worldview is implicitly defined by Disaster Archives + Shelter Info), no scene (scenes are woven into disaster and shelter descriptions), no organization (replaced by faction), and no prop (replaced by item). This is the most unique design of this method—all worldview information is distributed across four entity archive types.

#### 2.2 The isDynamic Field Mechanism

This method has a critical concept: **certain fields are marked isDynamic=true**, meaning their values change as the story progresses.

| Entity | Dynamic Field | Change Meaning |
|--------|--------------|----------------|
| Disaster Archive | Phase | Precursor -> Outbreak -> Sustained -> Subsiding |
| Shelter Info | SuppliesStatus | Abundant -> Tight -> Scarce -> Depleted |
| Critical Supplies | Quantity | Increases/decreases with consumption and acquisition |

**Narrative significance of dynamic fields**:
- They are **timeline markers**—Phase changes show where the story stands
- They are **tension generators**—watching Quantity drop from 500 to 5 is the source of suspense
- They are **decision triggers**—when SuppliesStatus becomes "Scarce," characters must make hard choices

During the creative process, update these dynamic fields at key plot points to reflect the story''s true state.

---

### III. Disaster Archive Design (event Category)

Disaster Archives are the core driver of this method. Each disaster is a non-singleton entity; you can create multiple.

#### 3.1 Field Descriptions

| Field | Description | Design Notes |
|-------|-------------|-------------|
| EventName | Disaster name | Specific and evocative: "First Polar Vortex," "Acid Rain Season" |
| Type | Disaster type | Extreme cold / Extreme heat / Flood / Acid rain / Insect plague / Earthquake / Corpse tide / Pandemic |
| Phase (isDynamic) | Disaster stage | Precursor -> Outbreak -> Sustained -> Subsiding; update as the story progresses |
| Impact | Environmental impact | Specific effects on environment, ecology, and human activity |

#### 3.2 Disaster Type Design Matrix

Each Type has distinct narrative functions and resource demands:

| Type | Core Threat | Key Resource Demand | Narrative Function |
|------|-------------|--------------------|--------------------|
| **Extreme cold** | Freezing, heating difficulty | Fuel, warm clothing, calorie-dense food | Base siege, tests stockpile |
| **Extreme heat** | Heatstroke, water evaporation | Water, cooling equipment, shade materials | Water resource warfare |
| **Flood** | Drowning, disease, severed transport | High ground, boats, water purifiers | Forces migration, separates characters |
| **Acid rain** | Corrosion, air pollution | Protective suits, sealing materials, indoor farming | Restricts outdoor activity, claustrophobia |
| **Insect plague** | Crop destruction, disease spread | Pesticides, sealed granaries, medical supplies | Catalyst for food crisis |
| **Earthquake** | Building collapse, terrain change | Construction materials, tools, emergency medicine | Destroys the base, rebuilding arc |
| **Corpse tide** | Direct physical threat | Weapons, fortifications, ammunition | Combat scenes, sacrifice and heroism |
| **Pandemic** | Contagious death, isolation | Medicine, quarantine facilities, protective gear | Trust crisis—accept outsiders or not? |

#### 3.3 Disaster Escalation Principles

**Core principle: Disasters must escalate, never plateau.**

Recommended escalation pattern:
```
Disaster 1 (single type): Extreme cold or heat -> Tests basic stockpile
Disaster 2 (compound): Acid rain + insect plague -> Outdoor restriction + food crisis
Disaster 3 (escalation): Earthquake -> Destroys existing base, forces rebuilding
Disaster 4 (complex): Pandemic + corpse tide -> Siege from within and without, ultimate trial
```

**Escalation dimensions**:
1. **Intensity escalation**: Each disaster is more severe than the last
2. **Type stacking**: Multiple disaster types occur simultaneously or in rapid succession
3. **Expanding coverage**: From local to regional to global
4. **Shortened recovery**: The next disaster hits before you catch your breath

#### 3.4 Phase Dynamic Management

The Phase field is isDynamic; update it as the story progresses:

| Phase | Narrative Function | Typical Events |
|-------|--------------------|---------------|
| **Precursor** | Builds tension, last preparation window | Abnormal weather, animal migration, sudden temperature changes |
| **Outbreak** | Climax, survival crisis | Disaster strikes directly, first casualties |
| **Sustained** | War of attrition, interpersonal conflicts intensify | Ongoing resource depletion, morale drops, defectors appear |
| **Subsiding** | Brief respite, damage assessment | Inventory supplies, repair facilities, decide next steps |

**Key**: During the creative process, when a disaster transitions from Outbreak to Sustained, update its Phase field in the Disaster Archive. This enables real-time tracking of each disaster''s progression.

---

### IV. Critical Supplies System (item Category)

Supplies are the soul of the hoarding genre. Each critical supply is a non-singleton entity.

#### 4.1 Field Descriptions

| Field | Description | Design Notes |
|-------|-------------|-------------|
| ItemName | Supply name | Specific item name, e.g., "Military compressed biscuits," "Portable water purifier" |
| Category | Supply category | Food & water / Medical / Weapons / Tools / Materials & fuel / Luxury goods |
| Rarity | Scarcity level | Ubiquitous -> Common -> Uncommon -> Rare -> Very rare -> Extinct |
| Quantity (isDynamic) | Amount | Update as supplies are consumed or acquired |
| Description | Supply description | Function, shelf life, use scenarios |

#### 4.2 Supply Categorization Strategy

| Category | Hoarding Priority | Example Core Items | Narrative Function |
|----------|------------------|--------------------|--------------------|
| **Food & water** | Highest | Compressed biscuits, bottled water, canned goods, rice/flour | Basic survival guarantee; consumed fastest |
| **Medical** | Very high | Antibiotics, tourniquets, fever reducers, surgical instruments | Key props for injury/illness plotlines |
| **Weapons** | High | Crossbows, machetes, riot shields, flare guns | Counter human threats and corpse tides |
| **Tools** | High | Generators, solar panels, walkie-talkies, toolboxes | Base construction and maintenance |
| **Materials & fuel** | Medium-high | Gasoline, cement, steel plates, lumber, coal | Base upgrades and heating |
| **Luxury goods** | Low (but important) | Cigarettes/alcohol, chocolate, books, seeds | Trade currency, morale maintenance |

#### 4.3 Rarity Economy

Pre-disaster and post-disaster Rarity are completely different—this contrast is key to dramatic tension:

| Item | Pre-disaster Rarity | Post-disaster Rarity | Narrative Tension |
|------|--------------------|-----------------------|-------------------|
| Bottled water | Ubiquitous | Rare | The most overlooked thing becomes the most precious |
| Antibiotics | Common | Very rare | One box of pills can buy a truckload of grain |
| Table salt | Ubiquitous | Uncommon | Civilization''s collapse starts with seasoning |
| Firearms & ammo | Very rare | Extinct | Whoever has weapons makes the rules |
| Seeds | Common | Very rare | Useless short-term but infinitely valuable long-term |
| Alcohol & tobacco | Common | Rare | Becomes the post-apocalypse hard currency |

#### 4.4 Quantity Dynamic Tracking

Quantity is an isDynamic field; update at key moments:

**When to update**:
- After major consumption (inventory check after a disaster)
- After acquiring new supplies (scavenging, trading, production)
- After supply loss (raided, destroyed by disaster, spoiled/expired)

**Narrative effect of Quantity changes**:
```
Quantity: 500 bottles -> Story begins, sense of security
Quantity: 200 bottles -> Consumption visible, tension builds
Quantity: 50 bottles -> Must venture out to scavenge or trade
Quantity: 10 bottles -> Survival crisis, sacrifices required
Quantity: 0 -> Desperation, maximum tension
```

#### 4.5 Hoarding Checklist Design Principles

**Realism**:
- Specify exact weight/volume ("50 kg of rice" not "lots of rice")
- Consider storage conditions (refrigeration/dry/sealed)
- Note shelf life (canned goods 3 years, medicine 2 years, gasoline 6 months)
- Calculate consumption rates (4 people using 2 liters of water/day = 240 liters for 30 days)

**Plausibility**:
- The protagonist''s finances determine their hoarding ceiling (a salary of 5,000/month cannot buy 1,000,000 worth of supplies)
- Transport and storage space are hard limits (how much fits in a van?)
- Shelf life is a ticking time bomb (expired supplies = useless supplies)

**Drama**:
- There is always one critical supply category that was overlooked (stockpiled food but forgot medicine; stockpiled weapons but no ammunition)
- Some supplies only reveal their value post-disaster (seeds, salt, flint)
- Supply distribution is the best tool for creating interpersonal conflict

---

### V. Shelter Info (facility Category)

The Shelter is a singleton entity—there is only one "home base" for the entire story.

#### 5.1 Field Descriptions

| Field | Description | Design Notes |
|-------|-------------|-------------|
| ShelterName | Shelter name | Distinctive name, e.g., "Underground Fortress," "Valley Camp" |
| Location | Geographic location | Specific terrain features; affects defense and resource access |
| DefenseLevel | Defense rating (1-10) | Reflects the base''s security level |
| Facilities | Facility list (array) | Currently available functional facilities |
| SuppliesStatus (isDynamic) | Supply status | Abundant / Tight / Scarce / Depleted |

#### 5.2 Location Site Selection Logic

Shelter location is a critical early-story decision that affects all subsequent plot developments:

| Site Type | Advantages | Disadvantages | Suitable Disasters |
|-----------|-----------|---------------|-------------------|
| **Basement / Underground** | Stable temperature, radiation-proof | Poor ventilation, flood risk | Extreme cold, extreme heat, acid rain |
| **Mountain highlands** | Flood-proof, good visibility | Difficult transport, supply hauling | Flood, corpse tide |
| **Abandoned military facility** | Strong defenses, large storage | May attract rival factions | All types |
| **Remote countryside** | Low population = less competition, farmable | Poor medical facilities, isolated | Pandemic, insect plague |

#### 5.3 DefenseLevel Progression Path

The DefenseLevel upgrade path from low to high IS the base-building narrative arc:

```
Level 1-2: Basic shelter (tent/abandoned house) -> Blocks wind and rain
Level 3-4: Basic reinforcement (fortified doors/windows, simple fencing) -> Blocks small incursions
Level 5-6: Moderate defense (walls, watchtower, traps) -> Resists medium threats
Level 7-8: Solid fortress (reinforced concrete, power system, surveillance) -> Withstands large-scale attacks
Level 9-10: Stronghold-grade (multiple defense perimeters, armory, self-sufficient systems) -> Nearly impregnable
```

**Design advice**:
- Start the story at DefenseLevel 1-3
- Reach 5-6 by mid-story for a sense of achievement
- Drop back to 3-4 when a major disaster hits (earthquake destroys walls) to create crisis
- Eventually reach 7-8, but never hit 10 (max level = no tension)

#### 5.4 Facilities Upgrade Path

Facilities is an array field representing the shelter''s current functional installations:

| Phase | Example Facilities | Unlock Requirements |
|-------|-------------------|---------------------|
| **Early** | Water barrel, simple stove, sleeping bags | Basic supplies |
| **Development** | Generator, basic medical room, vegetable garden | Tools + materials + manpower |
| **Mature** | Solar power system, radio station, greenhouse | Specialized skills + rare supplies |
| **Peak** | Water purification system, weapons workshop, underground storage | Large quantities of materials + teamwork |

#### 5.5 SuppliesStatus Dynamic Management

SuppliesStatus is an isDynamic field reflecting the shelter''s overall supply health:

| Status | Meaning | Trigger Events |
|--------|---------|---------------|
| **Abundant** | Plentiful reserves, no short-term worries | After major hoarding, successful scavenging |
| **Tight** | Consumption accelerating, planning needed | Population increase, disaster sustained phase |
| **Scarce** | A critical supply category nearing depletion | Prolonged siege, supplies raided |
| **Depleted** | Facing starvation / dehydration / no medicine | Extreme disasters, compound catastrophes |

---

### VI. Character Archive Design (character Category)

#### 6.1 Field Descriptions

| Field | Description | Design Notes |
|-------|-------------|-------------|
| Name | Character name | Concise and memorable |
| Identity | Pre-disaster identity/occupation | Determines the foundation for survival skills |
| Personality | Personality traits | Influences decision-making tendencies in the apocalypse |
| SurvivalSkill | Survival skills (array) | What the character can contribute (combat/medical/construction/farming, etc.) |
| MoralAlignment | Moral alignment | Lawful Good / Neutral Good / Chaotic Good / Lawful Neutral / True Neutral / Chaotic Neutral / Lawful Evil / Neutral Evil / Chaotic Evil |

#### 6.2 SurvivalSkill Design

SurvivalSkill is an array field; each character can have multiple survival skills. Skill design should follow:

**Skills stem from Identity**:
- Military veteran -> [Close combat, Marksmanship, Wilderness survival, Tactical command]
- Doctor -> [Surgery, Pharmaceutical preparation, Disease diagnosis]
- Construction worker -> [Building construction, Electrical repair, Welding]
- Farmer -> [Cultivation, Animal husbandry, Weather observation, Wild plant identification]
- Chef -> [Food processing, Ingredient preservation, Nutritional planning]

**Team complementarity principle**:
- The protagonist team''s SurvivalSkill sets should complement each other—not everyone should be a fighter
- Missing a certain skill type = narrative tension (what happens when someone is injured but there''s no doctor?)
- New characters joining the team are often justified by "we need their skills"

#### 6.3 MoralAlignment System

MoralAlignment is the core character design dimension in this method. The nine-alignment grid has unique meaning in a post-apocalyptic context:

| Alignment | Apocalypse Behavior | Typical Actions |
|-----------|-------------------|-----------------|
| **Lawful Good** | Upholds rules and moral bottom lines | Fair distribution even when supplies are tight; takes in refugees |
| **Neutral Good** | Good person, but flexible | Willing to help others, but won''t foolishly sacrifice themselves |
| **Chaotic Good** | Breaks rules but kind-hearted | Steals from enemies to give to refugees |
| **Lawful Neutral** | Rules above all | Enforces the supply distribution system strictly, regardless of pleas |
| **True Neutral** | Adapts to circumstances | Decides whether to help based on the situation, no preset stance |
| **Chaotic Neutral** | Looks out for self only | Won''t actively harm others but won''t help either; lone wolf |
| **Lawful Evil** | Exploits rules for personal gain | Establishes authoritarian rule, uses systems to oppress others |
| **Neutral Evil** | Selfish and unscrupulous | Would betray allies for their own supplies |
| **Chaotic Evil** | Pure destroyer | Raids, kills, takes pleasure in destruction |

**Narrative uses of MoralAlignment**:
1. **Alignment shifts are the best character arcs**: A Lawful Good person sliding toward Neutral or even Evil under extreme pressure
2. **Alignment conflicts are the best source of tension**: Lawful Good vs. Lawful Evil—both believe in rules but for opposite purposes
3. **The apocalypse is the proving ground for alignment**: Pre-disaster "good people" may not stay good; pre-disaster "troublemakers" may become heroes
4. **Alignment diversity within the protagonist team**: Some want to save everyone, others only want to protect their own—this divergence drives the plot

---

### VII. Narrative Structure: The Eight-Act Apocalypse

The hoarding genre has a distinctive eight-act narrative structure, each act with a different focus:

#### Act 1: Foreknowledge (~8%)

The protagonist gains disaster foreknowledge (rebirth/system/prophetic dream) and confirms catastrophe is imminent.

**Key points**:
- The source of foreknowledge must be plausible and limited (cannot know everything)
- The protagonist''s initial reaction should be authentic (doubt -> verification -> acceptance -> panic -> calm -> action)
- Time pressure: How long until the first disaster?

#### Act 2: Frantic Hoarding (~15%)

**This is the most satisfying phase of the hoarding genre.** The protagonist leverages foreknowledge for large-scale procurement.

**Key points**:
- The hoarding process needs granular detail (where to buy, what to buy, how much it costs, how to transport, where to store)
- There must be obstacles (insufficient funds, supplies bought out, arousing suspicion)
- This phase establishes the main supply entities with ItemName, Category, Rarity, Quantity, and Description
- The shelter is selected and basic construction begins during this phase

#### Act 3: Catastrophe Strikes (~10%)

The first disaster officially arrives. Create the first Disaster Archive entity.

**Key points**:
- Phase begins at Precursor and progresses to Outbreak
- The visual impact of the disaster must be powerful (the reader''s first experience of catastrophe)
- Social order begins to collapse (stores looted, transport paralyzed, communications severed)
- The protagonist''s advantage becomes evident (I was prepared!)

#### Act 4: Early Survival (~15%)

Struggling to survive through the first disaster, adapting to apocalypse rules.

**Key points**:
- The protagonist uses hoarded supplies to solve real problems (satisfaction moment)
- But there must be unforeseen difficulties (certain supply gaps, new threats)
- Quantity begins dropping; SuppliesStatus transitions from "Abundant" to "Tight"
- Begin taking in other survivors; the team starts forming

#### Act 5: Base Building (~15%)

The shelter upgrades from a crude dwelling to a functional base.

**Key points**:
- Facilities gradually increase; DefenseLevel steadily rises
- Each facility''s construction requires specific supplies and skills (linking item and character SurvivalSkill entities)
- The base-building process is the best stage for showcasing characters'' SurvivalSkill
- The first disaster enters the Subsiding phase; update Phase accordingly

#### Act 6: Interpersonal Conflict (~15%)

Supply distribution issues trigger internal tensions; external forces begin eyeing the base.

**Key points**:
- MoralAlignment differences formally erupt into disagreements
- External factions appear—possibly other survivor groups
- The second disaster compounds pressure
- SuppliesStatus may drop to "Scarce"
- The greatest enemy is often not the disaster but other people

#### Act 7: Expansion (~12%)

The protagonist team expands outward, establishing trade networks or absorbing other factions.

**Key points**:
- A supply trading system emerges (luxury goods become hard currency)
- Comprehensive application of the team''s collective SurvivalSkill
- The third disaster strikes (stronger, more complex)
- DefenseLevel is tested and then raised again

#### Act 8: Ultimate Catastrophe (~10%)

The final and most severe disaster (usually a compound catastrophe) delivers the ultimate test.

**Key points**:
- All prior supply reserves, base construction, and interpersonal relationships face the final exam
- Phase drives from Precursor all the way to Outbreak climax
- Quantity drops to its lowest; SuppliesStatus approaches "Depleted"
- The most agonizing moral choices must be made
- Ending: Hope of post-disaster rebuilding (seeds sprout, a child is born, a radio signal is received)

---

### VIII. Resource Management as Plot Driver

#### 8.1 Scarcity Creates Conflict

Supply scarcity is the most natural source of conflict in apocalypse stories:

| Scarcity Scenario | Resulting Conflict | Plot Direction |
|-------------------|--------------------|----------------|
| Water shortage | Accept new members or not? | Moral dilemma + potential mutiny |
| Medicine depleted | Injured person but no drugs | Risk going out to scavenge or abandon treatment |
| Food running out | Distribution ratio disputes | Internal fracture or collective breakout |
| Fuel exhausted | Generator stops, heating fails | Technical alternatives or base relocation |
| Weapons insufficient | Defense gaps | Outsmart rather than overpower, or diplomacy |

#### 8.2 Abundance Creates Complacency

Conversely, supply abundance also generates drama:
- Abundant supplies -> Security -> Lowered vigilance -> Ambush
- Abundant supplies -> Attract envy -> Siege
- Abundant supplies -> Internal power struggle -> Who distributes? Who leads?
- Abundant supplies -> External charity -> Moral extortion ("Why help them but not us?")

---

### IX. Human Nature Exploration: Moral Dilemmas Under Extreme Conditions

#### 9.1 Classic Moral Dilemma Templates

| Dilemma | Choice A | Choice B | Tension Source |
|---------|----------|----------|---------------|
| Save or not | Take in the wounded (costs supplies) | Refuse them (preserves supplies) | Kindness vs. survival |
| Share or not | Share grain with neighbors | Hoard to ensure your family''s safety | Altruism vs. self-interest |
| Kill or not | Execute thieves as a deterrent | Forgive but risk repeat offenses | Order vs. mercy |
| Stay or go | Abandon the base and relocate | Defend to the death but risk total loss | Reason vs. emotion |
| Truth or lie | Tell everyone supplies are nearly gone | Conceal to maintain morale | Transparency vs. stability |

#### 9.2 Alignment Shift Arcs

The best character arcs are trajectories of MoralAlignment change:
- **Fall arc**: Lawful Good -> True Neutral -> Lawful Evil (a good person ground into a dictator by reality)
- **Redemption arc**: Chaotic Neutral -> Chaotic Good -> Neutral Good (a lone wolf learns to fight for others)
- **Steadfast arc**: Lawful Good -> Lawful Good (choosing goodness after every trial—the most moving)
- **Collapse arc**: Neutral Good -> Neutral Evil -> Chaotic Evil (a good person fully corrupted—the most heartbreaking)

---

### X. Common Pitfalls

| Pitfall | Problem | Correct Approach |
|---------|---------|-----------------|
| **Unrealistic supplies** | Earning 5,000/month but hoarding 1,000,000 worth of supplies | Strictly limit financial and transport capacity |
| **No disaster escalation** | Every disaster is about the same severity | Follow escalation principles strictly—each one stronger/more complex |
| **Protagonist too successful** | Has everything, knows everything, always wins | Create critical oversights and unexpected losses |
| **Supplies only decrease** | Constant consumption with no replenishment | Design three replenishment paths: scavenging, trading, production |
| **One-dimensional conflicts** | Bad guys are simply bad, good guys are simply good | Use MoralAlignment to express moral gray areas |
| **Ignoring the timeline** | Phase/Quantity never change | Use isDynamic fields to track temporal progress |
| **Tedious base-building** | Dryly listing facility upgrades | Tie every upgrade to a specific challenge or conflict |
| **Ignoring shelf life** | Supplies last ten years without spoiling | Food/medicine/fuel all have expiration constraints |
| **Recovery too fast** | Civilization rebuilds in a few months | The core of the apocalypse is the pressure of "prolonged disorder" |

---

### XI. Pre-Writing Checklist

Confirm before you start writing:

- [ ] Have at least 3 escalating disasters been designed in the Disaster Archives (non-repeating Types or escalating compounds)?
- [ ] Do Critical Supplies cover all six Category types (food & water / medical / weapons / tools / materials & fuel / luxury goods)?
- [ ] Is the protagonist''s financial capacity consistent with their hoarding volume?
- [ ] Does the Shelter''s Location have strategic logic for its site selection?
- [ ] Are the team''s SurvivalSkill sets complementary across characters?
- [ ] Do characters'' MoralAlignment values have enough diversity to generate conflict?
- [ ] Is there a plan to update isDynamic fields (Phase / SuppliesStatus / Quantity) at key plot points?
- [ ] Have at least 2 major moral dilemmas been designed?
- [ ] Have supply consumption rates and shelf lives been roughly calculated?
- [ ] Does each disaster''s Impact specifically describe which supplies and facilities are affected?',
  (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1),
  1,
  100,
  NOW()
)
ON DUPLICATE KEY UPDATE
  description = VALUES(description),
  description_en = VALUES(description_en),
  instructions = VALUES(instructions),
  instructions_en = VALUES(instructions_en),
  novel_creation_method_id = VALUES(novel_creation_method_id),
  is_active = VALUES(is_active),
  sort_order = VALUES(sort_order),
  updated_at = NOW();
