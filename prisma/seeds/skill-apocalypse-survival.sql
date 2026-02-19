-- 末世天灾囤货流创作方法专属 Skill / Post-Apocalyptic Hoarding Genre - Disaster Simulation & Survival Design Skill
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '末世天灾囤货流' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-apocalypse-survival.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'apocalypse-survival',
  '末世天灾推演与生存设计：涵盖八大灾难类型的阶段推演与多灾叠加策略、避难所选址与防御等级递进、物资分类与稀缺度经济演变、角色生存技能互补与道德阵营冲突驱动、囤货流叙事节奏设计、以及非标准实体类型的工具使用指南',
  'Apocalypse disaster simulation and survival design: covers phase progression and multi-disaster stacking for eight disaster types, shelter site selection and defense level progression, supply categorization and scarcity economy evolution, character survival skill complementarity and moral alignment conflict drivers, hoarding narrative pacing design, and tool usage guide for non-standard entity types',
  '## 末世天灾推演与生存设计

本技能专注于「末世天灾囤货流」创作方法中的**天灾推演机制、生存系统设计和工具使用**。它不重复全局技能或创作方法指南中已有的内容，而是提供可直接落地的设计参考和操作指导。

---

### 一、天灾档案设计

天灾档案是 event 类别的实体，每一场天灾都是独立的非 singleton 实体。

#### 1.1 八大灾难类型深度解析

**极寒**
- 环境表现：气温骤降至零下40-60度，暴风雪覆盖，水管冻裂，混凝土开裂
- 核心威胁链：低温 → 冻伤/失温 → 取暖燃料消耗加速 → 食物热量需求激增 → 外出搜刮几乎不可能
- 致命细节：柴油在零下30度会凝固、电池续航骤降、金属徒手接触会粘连皮肤
- Impact 示例："气温降至-45°C，地表积雪超过2米，所有暴露管道冻裂，混凝土墙面出现冻融裂缝，户外停留超过15分钟即有冻伤风险"

**极热**
- 环境表现：气温飙升至50-60度，柏油路面融化，水源蒸发，空调系统全面崩溃
- 核心威胁链：高温 → 中暑/脱水 → 水源争夺 → 食物腐败加速 → 瘟疫滋生
- 致命细节：人体核心体温超过40度即有生命危险、电子设备过热停机、塑料制品软化变形
- Impact 示例："地表温度超过65°C，水库蒸发速度是正常值的8倍，未遮蔽的金属表面可造成瞬间烫伤，夜间气温仍维持在38°C以上"

**洪涝**
- 环境表现：持续暴雨、河流决堤、城市内涝、低洼地区完全淹没
- 核心威胁链：水位上升 → 建筑浸泡 → 电力系统短路 → 饮用水污染 → 传染病爆发
- 致命细节：洪水中暗藏漂浮碎片和尖锐物、污水携带多种病菌、湿度导致物资发霉
- Impact 示例："连续降雨72小时，累计降水量超过800mm，一楼全部被淹，地下设施完全报废，清洁水源被污水倒灌污染"

**酸雨**
- 环境表现：雨水pH值降至2-3，腐蚀金属和混凝土，植被枯死，空气中弥漫刺鼻气味
- 核心威胁链：酸蚀 → 建筑结构损伤 → 户外活动禁止 → 农作物全灭 → 长期食物危机
- 致命细节：皮肤暴露在酸雨中会灼伤、呼吸酸性气雾损伤肺部、金属防御设施加速老化
- Impact 示例："降水pH值2.4，露天金属设施腐蚀速度加快20倍，植被在48小时内枯萎，未经过滤的空气吸入可导致化学性肺炎"

**虫灾**
- 环境表现：蝗虫/变异昆虫铺天盖地，所有暴露的有机物被吞噬，噪音震耳
- 核心威胁链：虫群 → 粮食作物毁灭 → 密封不严的储粮被侵入 → 虫体腐烂带来疫病
- 致命细节：虫群可以啃穿布料和薄塑料、虫体堆积堵塞排水和通风系统、部分变异虫具有毒性
- Impact 示例："蝗虫密度达到每平方米200只以上，所有户外植被在24小时内被啃食殆尽，未经金属密封的粮仓全部沦陷，虫尸堆积引发次生卫生危机"

**地震**
- 环境表现：地面剧烈震动，建筑倒塌，地形改变，余震持续数周
- 核心威胁链：震动 → 建筑坍塌 → 人员被困 → 基础设施损毁 → 避难所降级甚至报废
- 致命细节：震后建筑可能随时二次坍塌、地下管网破裂导致燃气泄漏、地形变化可能封堵逃生路线
- Impact 示例："里氏8.2级地震，持续震动47秒，80%的低层建筑倒塌，地面出现宽达3米的裂缝，余震频率每天12-15次，防御工事损毁率超过60%"

**尸潮**
- 环境表现：变异生物或复活尸体成群出现，被噪音和光源吸引，不知疲倦地进攻
- 核心威胁链：尸潮来袭 → 防线受压 → 弹药消耗 → 噪音引来更多 → 防线崩溃
- 致命细节：尸体不怕痛不怕冷只怕火和头部打击、血液可能携带感染源、尸群会自发形成包围态势
- Impact 示例："尸群规模约3000-5000只，移动速度5-8km/h，被枪声吸引后30分钟内可聚集至声源位置，单体战力低但数量碾压，咬伤后12小时内出现感染症状"

**瘟疫**
- 环境表现：高传染性病原体扩散，感染者出现症状，密闭空间成为死亡陷阱
- 核心威胁链：病原扩散 → 团队内部感染 → 隔离消耗资源 → 信任崩塌 → 是否驱逐感染者的道德困境
- 致命细节：潜伏期内无症状但已具传染性、有限的医疗资源必须做取舍、防护装备一次性消耗极大
- Impact 示例："致死率约35%，潜伏期3-7天，飞沫和接触传播，感染后出现高热、出血、器官衰竭，现有抗生素无效，只能依靠隔离和对症支持治疗"

#### 1.2 灾难阶段推演机制

Phase 是天灾档案的 isDynamic 字段，必须在创作过程中随剧情更新。以下是每个阶段的详细推演框架：

**前兆期（Precursor）**
- 持续时间建议：1-3章
- 环境异常信号：动物异常行为、气压/温度反常、天空颜色异常、水位变化
- 主角行为窗口：这是最后的准备机会——紧急补充物资、加固避难所、召回外出队员
- 叙事功能：制造倒计时紧迫感，让读者跟着焦虑
- 更新触发：当环境异常不可忽视、主角团开始应急准备时，确认 Phase 为"前兆期"

**爆发期（Outbreak）**
- 持续时间建议：2-5章
- 灾害正面冲击：灾难以最大强度袭来，第一波伤亡出现
- 主角行为重点：紧急响应、执行预案、保护核心人员和物资
- 叙事功能：全书最高紧张度段落之一，密集的生死决策
- 更新触发：灾难正式降临、造成实际伤亡或损失时，更新 Phase 为"爆发期"

**持续期（Sustained）**
- 持续时间建议：5-10章
- 灾害进入稳态：强度可能略有降低但不消失，是消耗战
- 主角行为重点：资源管理、人员调度、处理内部矛盾、可能的外出补给行动
- 叙事功能：最考验角色性格和团队凝聚力的阶段，人际冲突在此集中爆发
- 更新触发：灾难从峰值回落但仍在持续时，更新 Phase 为"持续期"

**消退期（Subsiding）**
- 持续时间建议：1-3章
- 灾害逐渐减弱：环境开始恢复，但次生灾害可能出现
- 主角行为重点：清点损失、修复设施、评估物资余量、规划下一步
- 叙事功能：短暂喘息，总结得失，为下一场灾难做铺垫
- 更新触发：灾难明显减弱、可以开始恢复活动时，更新 Phase 为"消退期"

#### 1.3 多灾叠加策略

多灾叠加是提升故事张力的核心手段。设计叠加时遵循以下原则：

**互补型叠加**（两种灾害覆盖不同威胁维度）
- 极寒 + 瘟疫：密闭取暖空间成为传染温床，开窗通风又会冻死人
- 洪涝 + 虫灾：积水滋生蚊虫，虫灾在潮湿环境中加速繁殖
- 酸雨 + 地震：酸蚀削弱结构，地震一推就倒

**升级型叠加**（后者在前者基础上加码）
- 极寒 → 尸潮：冻僵的尸体在温度回升时"复活"，形成冰尸潮
- 瘟疫 → 尸潮：病死者变异为感染源，死亡不是终点
- 地震 → 洪涝：震后堤坝溃决引发洪水

**压迫型叠加**（两种灾害的应对方案互相矛盾）
- 尸潮 + 极热：需要密封避难所抵抗尸潮，但密封又导致散热不良
- 酸雨 + 虫灾：需要开放通风对抗虫灾闷热，但开放又引入酸性空气
- 洪涝 + 地震：需要高层躲避洪水，但高层在地震中最危险

**环境影响字段（Impact）的级联记录**：当多灾叠加时，Impact 应记录叠加后的复合效果而非单一灾害的影响。例如："极寒风暴持续中叠加尸潮：气温-38°C，冻僵的尸体在室内热源处聚集，防御人员无法在户外停留超过10分钟进行射击清除，弹药在极低温下可能卡壳"。

---

### 二、避难所设计

避难所信息是 facility 类别的实体。

#### 2.1 选址决策矩阵

选址不是单纯选"最好的"，而是选"最适合预期灾害类型"的：

| 选址类型 | 抗极寒 | 抗极热 | 抗洪涝 | 抗酸雨 | 抗虫灾 | 抗地震 | 抗尸潮 | 抗瘟疫 |
|---------|-------|-------|-------|-------|-------|-------|-------|-------|
| 半山别墅 | 中 | 差 | 优 | 中 | 中 | 差 | 优 | 中 |
| 地下防空洞 | 优 | 优 | 差 | 优 | 优 | 中 | 中 | 差 |
| 高层公寓 | 中 | 差 | 优 | 中 | 中 | 差 | 优 | 中 |
| 偏远农场 | 差 | 中 | 中 | 差 | 差 | 优 | 差 | 优 |
| 废弃工厂 | 中 | 中 | 中 | 中 | 差 | 中 | 中 | 中 |
| 军事掩体 | 优 | 优 | 优 | 优 | 优 | 优 | 优 | 中 |

"优"表示天然适合，"中"表示需要改造，"差"表示有致命缺陷。

**选址的叙事意义**：完美选址会让故事缺乏张力。建议选择有2-3项"差"评级的选址，这些弱点就是后续剧情冲突的来源。例如选了半山别墅，那么地震来袭时就是重大危机。

#### 2.2 防御等级（DefenseLevel）递进设计

DefenseLevel 是 1-10 的整数，每个等级对应具体的防御能力：

**等级 1-3：基础生存级**
- 1 级：锁好门窗，堆放家具做路障。能挡住好奇的路人，挡不住任何有组织进攻
- 2 级：门窗加装铁栅、简易警报（铃铛/绊线）。能延迟入侵5-10分钟
- 3 级：围墙（1.5-2米）、加固大门、简易瞭望点。能抵挡小股散兵

**等级 4-6：中等防御级**
- 4 级：围墙加装铁丝网/尖刺、多个瞭望塔、储物地窖。能抵挡十余人的攻击
- 5 级：外围陷阱带（地钉、绊线、坠落陷阱）、内部分区隔离门。即使外墙被突破仍有纵深
- 6 级：监控系统（哪怕是简易的）、射击口、备用出口/逃生通道。系统化的防御体系

**等级 7-8：堡垒级**
- 7 级：混凝土加固墙体、发电系统（柴油/太阳能）、武器库、通讯设备。可自持防御数日
- 8 级：多重防线（外围→中环→核心区）、自动化警报、医疗室、独立水源。小型军事据点水平

**等级 9-10：要塞级**
- 9 级：军事级防御工事、完整的自给自足系统（水循环、温室、发电）、有组织的巡逻编制
- 10 级：理论上的完美要塞。建议永远不要让避难所达到此等级——留有弱点才有故事

**升级事件绑定**：每次 DefenseLevel 提升都应对应一个具体的叙事事件。不要写"我们升级了防御"，而要写"用从废弃军营搜来的铁丝网加固了东墙，花了三天时间，期间差点被路过的流浪团体发现"。

#### 2.3 设施（Facilities）构建路径

Facilities 是 array 字段，每个元素代表一项功能设施。设施的获取需要三个前提条件：物资、技能、时间。

**水系统线**
- 起步：蓄水桶 + 手动净水器 → 需要：容器、净水片
- 进阶：雨水收集系统 + 沙石过滤池 → 需要：管道材料、施工技能
- 高级：水循环净化系统 → 需要：电力、水泵、过滤膜、专业技能

**电力线**
- 起步：手摇发电机 + 蓄电池 → 需要：基础电子元件
- 进阶：柴油发电机 → 需要：柴油（持续消耗）、机械维修技能
- 高级：太阳能板 + 风力发电 + 电池组 → 需要：稀缺材料、电气工程技能

**食物线**
- 起步：食品储藏室（干燥密封） → 需要：密封材料
- 进阶：温室种植箱（LED + 营养液） → 需要：种子、照明设备、种植技能
- 高级：小型水培农场 + 种子库 → 需要：稳定电力、专业农业知识

**防御线**
- 起步：围墙 + 简易路障 → 需要：建材、人力
- 进阶：瞭望塔 + 陷阱带 + 射击口 → 需要：工具、战术知识
- 高级：监控系统 + 自动化预警 → 需要：电子设备、电力、技术人员

**医疗线**
- 起步：急救箱 + 简易隔离区 → 需要：基础医疗物资
- 进阶：手术台 + 输液设备 + 药品柜 → 需要：医疗器械、医生
- 高级：实验室（检测/制药） → 需要：专业设备、高级医疗人员

#### 2.4 物资状态（SuppliesStatus）动态管理

SuppliesStatus 是避难所的 isDynamic 字段，反映整体物资健康度。更新它时应综合考虑所有物资类别：

| 状态 | 判断标准 | 行动建议 |
|------|---------|---------|
| 充足 | 所有类别物资可支撑30天以上 | 可考虑扩张或救援他人 |
| 紧张 | 有1-2类物资降至15天以下 | 限制消耗、计划补给 |
| 匮乏 | 有物资降至7天以下 | 紧急外出搜刮或交易 |
| 耗尽 | 有关键物资（水/食物/药品）降至3天以下 | 生存危机，必须立即行动 |

---

### 三、物资管理体系

重要物资是 item 类别的实体，每种关键物资独立建档。

#### 3.1 六大分类的叙事定位

**食物/水**——生存基石
- 消耗速度：最快，每天都在减少
- 冲突制造：最直接的矛盾来源（"分给不分给""吃饱还是省着"）
- 稀缺演变：灾前"随处可见"→ 灾后第一周"普通"→ 一个月后"稀有"→ 长期"极其罕见"
- 关键物资举例：纯净水（5L/桶）、军用压缩饼干（200g/包）、罐头（各类）、大米（25kg/袋）

**医疗药品**——生命线
- 消耗速度：不稳定，取决于伤病频率
- 冲突制造：最极端的道德困境（"只剩一支抗生素，救谁？"）
- 稀缺演变：灾前"普通"→ 灾后"稀有"→ 长期"极其罕见"→ 某些特效药"绝版"
- 关键物资举例：广谱抗生素（盒）、止痛药（瓶）、绷带纱布（卷）、手术缝合线（套）

**武器弹药**——力量天平
- 消耗速度：爆发式消耗（一次尸潮可能消耗数百发弹药）
- 冲突制造：权力的象征（"谁控制武器谁说了算"）
- 稀缺演变：灾前"极其罕见"（非军事人员）→ 灾后更加稀缺 → "绝版"
- 关键物资举例：弩箭（支）、砍刀（把）、弓弩（把）、信号弹（发）

**生存工具**——建设基础
- 消耗速度：慢，但损坏后难以替代
- 冲突制造：功能依赖（"发电机坏了，谁会修？"）
- 稀缺演变：灾前"普通"→ 灾后"稀有"（没有工厂在生产了）
- 关键物资举例：便携发电机（台）、太阳能充电板（块）、对讲机（对）、工具箱（套）

**材料/燃料**——运转血液
- 消耗速度：中等，取暖和发电是大头
- 冲突制造：冬季来临时的燃料恐慌
- 稀缺演变：灾前"随处可见"→ 灾后两周"普通"→ 一个月后"稀有"→ 冬季"极其罕见"
- 关键物资举例：汽油（升）、柴油（升）、钢板（张）、水泥（袋）、木材（立方米）

**奢侈品**——末世货币
- 消耗速度：看个人意志力
- 冲突制造：交易媒介和士气工具
- 稀缺演变：灾前"普通"→ 灾后"稀有"→ 成为硬通货
- 关键物资举例：香烟（条）、白酒（瓶）、巧克力（板）、书籍（本）、药用种子（袋）

#### 3.2 稀缺度（Rarity）的阶段性演变

设计物资的 Rarity 时，应考虑当前故事所处的灾难阶段：

| 物资类型 | 前兆期 | 爆发期 | 持续期 | 消退期 |
|---------|-------|-------|-------|-------|
| 纯净水 | 随处可见 | 普通 | 稀有 | 稀有 |
| 罐头食品 | 随处可见 | 普通 | 稀有 | 极其罕见 |
| 抗生素 | 普通 | 稀有 | 极其罕见 | 绝版 |
| 汽油 | 普通 | 稀有 | 极其罕见 | 极其罕见 |
| 弹药 | 极其罕见 | 绝版 | 绝版 | 绝版 |
| 食盐 | 随处可见 | 随处可见 | 稀有 | 极其罕见 |
| 种子 | 普通 | 普通 | 稀有 | 极其罕见 |
| 香烟/酒 | 普通 | 稀有 | 极其罕见 | 极其罕见 |

**叙事运用**：当某物资的 Rarity 从"稀有"跳升到"极其罕见"或"绝版"时，应对应一个重大剧情事件——要么是供应链彻底断裂，要么是被大规模劫掠，要么是自然损耗过了临界点。

#### 3.3 数量（Quantity）的消耗曲线设计

Quantity 是 isDynamic 字段。设计消耗曲线时考虑以下模型：

**线性消耗**：日常食物和水，每天固定消耗量
- 公式思路：初始量 - （每人每日消耗 × 人数 × 天数）
- 示例：200升水 →（2升 × 4人 × 1天 = 8升）→ 可用25天

**爆发消耗**：弹药、医疗物资，平时几乎不用但战斗/伤病时大量消耗
- 一次尸潮防御可能消耗弩箭50支、绷带10卷
- 一个重伤员可能消耗一整盒抗生素和所有手术耗材

**递减消耗**：燃料，随着节约意识增强而降低使用量
- 初期：每天运行发电机8小时
- 中期：每天4小时，只在必要时使用
- 后期：每天1小时，仅维持通讯和医疗设备

**关键节点更新**：在以下时刻必须更新 Quantity——
- 一场灾难的爆发期结束后（大消耗清算）
- 成功完成一次搜刮行动后（补充入账）
- 发生物资被劫/损毁事件后（意外损失）
- 新成员加入导致消耗速度变化后（基线调整）

---

### 四、角色的生存技能与道德阵营

角色档案是 character 类别的实体。

#### 4.1 生存技能（SurvivalSkill）互补设计

一个末世生存团队至少需要覆盖以下五个技能域：

| 技能域 | 包含技能 | 缺失后果 |
|-------|---------|---------|
| **战斗** | 射击、近身格斗、战术指挥、陷阱制作 | 无法抵御外部威胁 |
| **医疗** | 急救、外科手术、药物配制、疾病诊断 | 伤病无法治疗，团队减员 |
| **建造** | 建筑施工、电气维修、焊接、机械修理 | 避难所无法升级和维护 |
| **生产** | 种植、畜牧、烹饪、食材保存 | 长期食物供应断裂 |
| **侦察** | 驾驶、地图导航、气象观测、野外求生 | 外出行动成功率极低 |

**技能与 Identity 的对应关系**：
- 退伍军人 → 战斗域（射击、近身格斗、战术指挥）+ 侦察域（野外求生）
- 外科医生 → 医疗域（外科手术、急救、疾病诊断）
- 建筑工程师 → 建造域（建筑施工、电气维修）
- 农学院学生 → 生产域（种植、食材保存）+ 侦察域（气象观测）
- 厨师 → 生产域（烹饪、食材保存）
- 电工 → 建造域（电气维修、焊接）
- 护士 → 医疗域（急救、药物配制）
- 猎人/户外爱好者 → 侦察域（驾驶、野外求生）+ 战斗域（射击）

**设计建议**：主角团初期应有明显的技能缺口（例如没有医疗人员），这个缺口就是后续招募新成员的叙事动力，也是创造危机场景的切入点。

#### 4.2 道德阵营（MoralAlignment）冲突设计

本方法的 MoralAlignment 只有五个选项，每个选项在末世情境下的行为模式：

**守序善良**
- 末世信条："我们必须保持人性，否则活下来也没有意义"
- 典型决策：坚持公平分配物资、收留伤者和老弱、不主动攻击其他幸存者
- 冲突触发：当物资不够所有人活命时，这种善良就变成了团队的负担

**中立善良**
- 末世信条："我愿意帮人，但不能把我们自己搭进去"
- 典型决策：帮助有交换价值的幸存者、在安全范围内施援、拒绝明显会拖累团队的请求
- 冲突触发：善良的底线在哪里？"有交换价值"这个标准本身是否已经不善良了？

**绝对中立**
- 末世信条："活下去是唯一的原则，其他都可以商量"
- 典型决策：理性评估每个决定的利弊、不被感情左右、必要时可以做出冷酷但正确的决定
- 冲突触发：其他人觉得这种理性冷血得可怕，尤其在涉及生死抉择时

**混乱中立**
- 末世信条："别管我，我也不管你"
- 典型决策：不主动害人也不主动帮人、行为不可预测、可能突然离队或突然回来
- 冲突触发：团队需要稳定性和信任，这种不可预测是团队协作的毒药

**混乱邪恶**
- 末世信条："弱肉强食，适者生存"
- 典型决策：抢劫其他幸存者、为了自己的利益出卖队友、以暴力维持控制
- 冲突触发：这是天然的反派阵营，但好的写法是展示一个人如何从善良一步步滑入邪恶

**阵营冲突剧情模板**：

场景一：门外有一家三口求救
- 守序善良：必须开门收留
- 中立善良：先确认他们没有感染再决定
- 绝对中立：评估我们的物资能否承受多三个人
- 混乱中立：跟我无关，你们决定
- 混乱邪恶：搜他们的东西然后赶走

场景二：发现团队中有人偷藏物资
- 守序善良：警告一次，再犯驱逐
- 中立善良：理解动机但必须归还
- 绝对中立：重新制定分配制度防止再犯
- 混乱中立：我也偷藏了一点，彼此彼此
- 混乱邪恶：以此为把柄控制对方

---

### 五、囤货流叙事节奏

#### 5.1 经典囤货流结构

**预知阶段**（全文的5-10%）
- 核心事件：主角通过重生/系统/预知梦等方式得知天灾将至
- 节奏：快节奏，主角从怀疑到验证到接受的心理转变要迅速
- 关键产出：确定第一场天灾的类型和时间，建立紧迫感

**囤货阶段**（全文的10-15%）
- 核心事件：主角利用倒计时疯狂采购和储备
- 节奏：明快爽文节奏，一张张购物清单、一车车搬运的满足感
- 读者爽点：看着物资清单不断增长的"仓鼠囤货"快感
- 关键产出：建立主要物资实体（item），确定避难所（facility），展示主角的计划性

**灾难降临**（全文的8-10%）
- 核心事件：第一场天灾正式爆发
- 节奏：骤然加速，从日常切换到生存模式的落差感
- 关键产出：创建第一个天灾档案（event），Phase 设为"前兆期"然后推至"爆发期"

**消耗与管理**（全文的15-20%）
- 核心事件：在灾难中挣扎求生，物资逐渐消耗
- 节奏：中速偏紧张，每一个消耗决策都有份量
- 关键产出：Quantity 持续下降，SuppliesStatus 从"充足"向"紧张"过渡

**外出补给**（全文的15-20%）
- 核心事件：物资不足，必须冒险外出搜刮
- 节奏：动作冒险节奏，危险与收获并存
- 结构建议：每次外出是一个完整的小故事弧——准备→出发→遭遇危险→获取物资→返回
- 关键产出：物资 Quantity 回升，可能招募新成员，发现新威胁

**扩建升级**（全文的15-20%）
- 核心事件：升级避难所、扩展防御、建立新设施
- 节奏：建设经营节奏，基地一点点变强的成就感
- 关键产出：Facilities 增加，DefenseLevel 提升

**人际冲突与灾难升级**（全文的15-20%）
- 核心事件：内部矛盾爆发 + 新的更强天灾来袭
- 节奏：双线并进的紧张感——内忧外患
- 关键产出：MoralAlignment 冲突显现化，新天灾档案（event）创建

#### 5.2 "一次补给一个弧"原则

每次外出补给行动应构成一个完整的叙事弧：

1. **准备**（1章）：确定目标地点、评估风险、分配装备、安排留守
2. **出发与抵达**（1-2章）：路途中的环境描写和小规模遭遇
3. **核心冲突**（2-3章）：在目标地点遇到的主要挑战（其他幸存者、灾害残余、建筑坍塌）
4. **获取与抉择**（1章）：找到物资但面临选择（拿什么放弃什么、帮不帮遇到的人）
5. **返程**（1-2章）：带着收获返回，可能遭遇追踪或新危险

#### 5.3 满足感节奏设计

囤货流的核心读者体验是"准备→验证"的满足循环：

- 主角囤了大量保暖物资 → 极寒来袭，保暖物资救命 → 读者获得"先知优越感"
- 主角忘记囤某类物资 → 危机来袭，手忙脚乱 → 读者获得"紧张刺激感"
- 主角囤的物资被劫 → 辛苦白费需要重新获取 → 读者获得"愤怒代入感"
- 主角搜刮到意外的稀缺物资 → 化解了燃眉之急 → 读者获得"惊喜感"

**关键原则**：满足和挫折必须交替出现，纯粹的满足会无聊，纯粹的挫折会劝退。

---

### 六、工具使用指南

**重要提醒：本创作方法使用完全非标准的实体类别系统。** 以下是使用各类工具的正确方式。

#### 6.1 查看可用实体类型

首先通过 `get_novel_overview` 查看当前小说的所有可用模块类型。本方法的 visible_categories 为 ["character", "event", "facility", "item"]，不包含标准的 setting、scene、prop、organization。

#### 6.2 各实体类型的操作方式

**角色档案（entity_category = "character"）**
- 创建：可以使用 `create_character` 工具，因为其 entity_category 是标准的 "character"
- 修改基础字段：按照角色操作技能的标准流程
- 更新动态字段（CurrentState、Equipment）：使用 `update_field_dynamic_info` 工具

**天灾档案（entity_category = "event"）**
- 创建：使用通用模块创建工具，指定对应的 module_type_id
- 创建前需要：先通过 `get_novel_overview` 获取 event 类别的 module_type_id，再查询其 JSON Schema
- 更新 Phase：使用 `update_field_dynamic_info` 工具，这是最频繁的操作之一

**避难所信息（entity_category = "facility"）**
- 创建：使用通用模块创建工具
- 创建前需要：先查询 facility 类别的 module_type_id 和 JSON Schema
- 更新 SuppliesStatus：使用 `update_field_dynamic_info` 工具

**重要物资（entity_category = "item"）**
- 创建：使用通用模块创建工具
- 创建前需要：先查询 item 类别的 module_type_id 和 JSON Schema
- 更新 Quantity：使用 `update_field_dynamic_info` 工具

#### 6.3 动态字段更新场景速查

| 工具 | 实体类型 | 字段 | 典型更新场景 |
|------|---------|------|------------|
| `update_field_dynamic_info` | 天灾档案 | Phase | 灾难从前兆期进入爆发期、从爆发期进入持续期等 |
| `update_field_dynamic_info` | 避难所信息 | SuppliesStatus | 大量物资消耗后、成功补给后、被劫掠后 |
| `update_field_dynamic_info` | 重要物资 | Quantity | 日常消耗清算、外出搜刮回来、物资损失事件后 |
| `update_field_dynamic_info` | 角色档案 | CurrentState | 角色受伤、康复、心理状态变化时 |
| `update_field_dynamic_info` | 角色档案 | Equipment | 角色获取/失去装备时 |

#### 6.4 Schema 查询流程

由于本方法的实体类型是非标准的，在创建任何实体之前，建议按以下步骤操作：

1. 调用 `get_novel_overview` 获取当前小说的完整模块类型列表
2. 找到目标 entity_category（event/facility/item/character）对应的 module_type
3. 记录其 module_type_id
4. 查询该 module_type 的完整 JSON Schema（包含所有字段定义、枚举值、动态标记等）
5. 按照 Schema 定义填写实体数据进行创建',
  '## Apocalypse Disaster Simulation and Survival Design

This skill focuses on **disaster simulation mechanics, survival system design, and tool usage** within the "Post-Apocalyptic Hoarding Genre" (末世天灾囤货流) creation method. It does not repeat content from global skills or the creation method guide, but provides directly actionable design references and operational guidance.

---

### 1. Disaster Archive Design

Disaster Archives are entities of the event category. Each disaster is an independent non-singleton entity.

#### 1.1 In-Depth Analysis of Eight Disaster Types

**Extreme Cold**
- Environmental manifestation: Temperatures plunge to -40 to -60°C, blizzards blanket everything, pipes freeze and burst, concrete cracks
- Core threat chain: Low temperature -> Frostbite/hypothermia -> Heating fuel consumption accelerates -> Food calorie demand surges -> Outdoor scavenging becomes nearly impossible
- Lethal details: Diesel gels at -30°C, battery life drops dramatically, bare skin sticks to metal on contact
- Impact example: "Temperature dropped to -45°C, ground snow exceeds 2 meters, all exposed pipes burst, concrete walls show freeze-thaw cracks, outdoor exposure beyond 15 minutes risks frostbite"

**Extreme Heat**
- Environmental manifestation: Temperatures soar to 50-60°C, asphalt melts, water sources evaporate, air conditioning systems collapse entirely
- Core threat chain: High temperature -> Heatstroke/dehydration -> Water source competition -> Food spoilage accelerates -> Plague breeds
- Lethal details: Core body temperature above 40°C is life-threatening, electronics overheat and shut down, plastic items soften and deform
- Impact example: "Surface temperature exceeds 65°C, reservoir evaporation rate is 8x normal, unshielded metal surfaces cause instant burns, nighttime temperature remains above 38°C"

**Flood**
- Environmental manifestation: Continuous downpour, river levees breach, urban flooding, low-lying areas completely submerged
- Core threat chain: Water levels rise -> Buildings saturated -> Electrical systems short-circuit -> Drinking water contaminated -> Infectious disease outbreak
- Lethal details: Floodwater conceals floating debris and sharp objects, sewage carries multiple pathogens, humidity causes supplies to mold
- Impact example: "Continuous rainfall for 72 hours, cumulative precipitation exceeds 800mm, all ground floors submerged, underground facilities completely destroyed, clean water sources contaminated by sewage backflow"

**Acid Rain**
- Environmental manifestation: Rainwater pH drops to 2-3, corroding metal and concrete, vegetation dies, air fills with acrid smell
- Core threat chain: Acid erosion -> Structural damage -> Outdoor activity forbidden -> All crops destroyed -> Long-term food crisis
- Lethal details: Skin exposed to acid rain suffers chemical burns, breathing acid aerosol damages lungs, metal defensive structures age rapidly
- Impact example: "Precipitation pH 2.4, corrosion rate of exposed metal structures increased 20x, vegetation withered within 48 hours, unfiltered air inhalation can cause chemical pneumonia"

**Insect Plague**
- Environmental manifestation: Locusts/mutant insects blot out the sky, all exposed organic matter devoured, deafening noise
- Core threat chain: Swarms -> Crop destruction -> Improperly sealed grain stores infiltrated -> Decaying insect bodies bring disease
- Lethal details: Swarms can gnaw through fabric and thin plastic, insect carcasses clog drainage and ventilation systems, some mutant insects are venomous
- Impact example: "Locust density exceeds 200 per square meter, all outdoor vegetation consumed within 24 hours, all non-metal-sealed granaries compromised, insect carcass accumulation triggers secondary sanitation crisis"

**Earthquake**
- Environmental manifestation: Violent ground shaking, buildings collapse, terrain changes, aftershocks continue for weeks
- Core threat chain: Shaking -> Building collapse -> People trapped -> Infrastructure destroyed -> Shelter downgraded or rendered unusable
- Lethal details: Post-quake buildings may collapse again at any time, underground pipe network ruptures cause gas leaks, terrain changes may block escape routes
- Impact example: "Magnitude 8.2 earthquake, 47 seconds of sustained shaking, 80% of low-rise buildings collapsed, ground fissures up to 3 meters wide, aftershock frequency 12-15 per day, defensive fortification destruction rate exceeds 60%"

**Corpse Tide**
- Environmental manifestation: Mutated creatures or reanimated corpses appear in hordes, attracted by noise and light, attacking tirelessly
- Core threat chain: Tide approaches -> Defensive lines pressured -> Ammunition consumed -> Noise attracts more -> Lines collapse
- Lethal details: Corpses feel no pain or cold, only fear fire and headshots; blood may carry infectious agents; hordes spontaneously form encirclement patterns
- Impact example: "Horde size approximately 3,000-5,000 units, movement speed 5-8 km/h, can converge on a sound source within 30 minutes of gunfire, individually weak but numerically overwhelming, infection symptoms appear within 12 hours of a bite"

**Pandemic**
- Environmental manifestation: Highly contagious pathogen spreads, infected show symptoms, enclosed spaces become death traps
- Core threat chain: Pathogen spread -> Internal team infection -> Quarantine consumes resources -> Trust collapses -> Moral dilemma of whether to expel the infected
- Lethal details: Incubation period is asymptomatic but contagious, limited medical resources force triage, protective equipment is consumed rapidly
- Impact example: "Fatality rate approximately 35%, incubation period 3-7 days, transmission via droplets and contact, infection presents with high fever, bleeding, organ failure, existing antibiotics ineffective, only isolation and supportive treatment available"

#### 1.2 Disaster Phase Progression Mechanism

Phase is the isDynamic field of Disaster Archives and must be updated as the story progresses. Below is a detailed progression framework for each phase:

**Precursor Phase**
- Recommended duration: 1-3 chapters
- Environmental anomaly signals: Abnormal animal behavior, barometric/temperature anomalies, unusual sky colors, water level changes
- Protagonist action window: This is the last chance to prepare -- emergency supply replenishment, shelter reinforcement, recalling field teams
- Narrative function: Creates countdown urgency, makes the reader anxious alongside the characters
- Update trigger: When environmental anomalies become undeniable and the team begins emergency preparations, confirm Phase as "Precursor"

**Outbreak Phase**
- Recommended duration: 2-5 chapters
- Direct disaster impact: Catastrophe strikes at maximum intensity, first casualties occur
- Protagonist action focus: Emergency response, executing contingency plans, protecting core personnel and supplies
- Narrative function: One of the book''s highest-tension passages, dense life-and-death decisions
- Update trigger: When the disaster officially strikes and causes actual casualties or losses, update Phase to "Outbreak"

**Sustained Phase**
- Recommended duration: 5-10 chapters
- Disaster enters steady state: Intensity may decrease slightly but does not disappear; this is a war of attrition
- Protagonist action focus: Resource management, personnel coordination, handling internal conflicts, possible resupply missions
- Narrative function: The phase that most tests character personalities and team cohesion; interpersonal conflicts erupt here
- Update trigger: When the disaster recedes from its peak but persists, update Phase to "Sustained"

**Subsiding Phase**
- Recommended duration: 1-3 chapters
- Disaster gradually weakens: Environment begins recovering, but secondary disasters may emerge
- Protagonist action focus: Assessing losses, repairing facilities, evaluating remaining supplies, planning next steps
- Narrative function: Brief respite, summarizing gains and losses, foreshadowing the next disaster
- Update trigger: When the disaster has clearly weakened and recovery activities can begin, update Phase to "Subsiding"

#### 1.3 Multi-Disaster Stacking Strategies

Multi-disaster stacking is the core technique for escalating story tension. Follow these principles when designing stacks:

**Complementary Stacking** (two disasters covering different threat dimensions)
- Extreme cold + Pandemic: Sealed heated spaces become breeding grounds for infection; opening windows for ventilation risks freezing
- Flood + Insect plague: Standing water breeds mosquitoes; insect plagues proliferate faster in humid environments
- Acid rain + Earthquake: Acid erosion weakens structures; an earthquake topples them

**Escalation Stacking** (the second disaster builds on the first)
- Extreme cold -> Corpse tide: Frozen corpses "reanimate" as temperatures rise, forming an ice-corpse tide
- Pandemic -> Corpse tide: Disease victims mutate into infection sources; death is not the end
- Earthquake -> Flood: Post-quake dam failures trigger flooding

**Oppressive Stacking** (two disasters whose countermeasures contradict each other)
- Corpse tide + Extreme heat: Need to seal the shelter against the tide, but sealing prevents heat dissipation
- Acid rain + Insect plague: Need open ventilation against insect-swarm heat, but openings admit acidic air
- Flood + Earthquake: Need upper floors to escape flooding, but upper floors are most dangerous in earthquakes

**Cascading Impact Field Recording**: When multiple disasters stack, the Impact field should record the compound effect rather than individual disaster impacts. For example: "Extreme cold storm ongoing with corpse tide overlay: temperature -38°C, frozen corpses congregate near indoor heat sources, defense personnel cannot remain outdoors for more than 10 minutes for shooting and clearing, ammunition may jam at extreme low temperatures."

---

### 2. Shelter Design

Shelter Info is an entity of the facility category.

#### 2.1 Site Selection Decision Matrix

Site selection is not about choosing "the best" but choosing "the best fit for expected disaster types":

| Site Type | vs. Cold | vs. Heat | vs. Flood | vs. Acid | vs. Insects | vs. Quake | vs. Tide | vs. Plague |
|-----------|---------|---------|----------|---------|------------|----------|---------|-----------|
| Hillside villa | Med | Poor | Good | Med | Med | Poor | Good | Med |
| Underground bunker | Good | Good | Poor | Good | Good | Med | Med | Poor |
| High-rise apartment | Med | Poor | Good | Med | Med | Poor | Good | Med |
| Remote farm | Poor | Med | Med | Poor | Poor | Good | Poor | Good |
| Abandoned factory | Med | Med | Med | Med | Poor | Med | Med | Med |
| Military bunker | Good | Good | Good | Good | Good | Good | Good | Med |

"Good" means naturally suited, "Med" means requires modification, "Poor" means has a critical vulnerability.

**Narrative significance of site selection**: A perfect site makes the story lack tension. Choose a site with 2-3 "Poor" ratings -- those weaknesses become the source of future plot conflicts. For example, choosing a hillside villa means an earthquake becomes a major crisis.

#### 2.2 Defense Level (DefenseLevel) Progression Design

DefenseLevel is an integer from 1-10; each level corresponds to specific defensive capabilities:

**Level 1-3: Basic Survival**
- Level 1: Locked doors and windows, furniture barricades. Stops curious passersby; stops nothing organized
- Level 2: Iron bars on windows, simple alarms (bells/tripwires). Delays intrusion by 5-10 minutes
- Level 3: Wall (1.5-2m), reinforced gate, simple lookout point. Can repel small groups of stragglers

**Level 4-6: Moderate Defense**
- Level 4: Barbed wire/spikes on walls, multiple watchtowers, storage cellar. Can withstand attacks by a dozen people
- Level 5: Outer trap belt (ground spikes, tripwires, pitfalls), internal zone isolation doors. Depth defense even if outer wall is breached
- Level 6: Surveillance system (even basic), firing ports, backup exits/escape tunnels. Systematized defense architecture

**Level 7-8: Fortress Grade**
- Level 7: Reinforced concrete walls, power system (diesel/solar), armory, communications equipment. Can self-sustain defense for days
- Level 8: Multiple defense rings (outer -> middle -> core), automated alerts, medical room, independent water source. Small military outpost level

**Level 9-10: Stronghold Grade**
- Level 9: Military-grade fortifications, complete self-sufficient systems (water recycling, greenhouse, power generation), organized patrol rotations
- Level 10: Theoretically perfect stronghold. Never let the shelter reach this level -- weaknesses make stories

**Upgrade event binding**: Every DefenseLevel increase should correspond to a specific narrative event. Do not write "we upgraded our defenses"; instead write "spent three days reinforcing the east wall with barbed wire scavenged from an abandoned military camp, nearly discovered by a passing scavenger group in the process."

#### 2.3 Facilities Construction Path

Facilities is an array field; each element represents a functional installation. Acquiring facilities requires three prerequisites: supplies, skills, and time.

**Water System Line**
- Starter: Water barrels + manual water purifier -> Requires: containers, purification tablets
- Intermediate: Rainwater collection system + sand-gravel filtration pool -> Requires: piping materials, construction skills
- Advanced: Water recycling purification system -> Requires: electricity, water pump, filtration membranes, specialist skills

**Power Line**
- Starter: Hand-crank generator + battery -> Requires: basic electronic components
- Intermediate: Diesel generator -> Requires: diesel (ongoing consumption), mechanical repair skills
- Advanced: Solar panels + wind turbine + battery bank -> Requires: scarce materials, electrical engineering skills

**Food Line**
- Starter: Food storage room (dry, sealed) -> Requires: sealing materials
- Intermediate: Greenhouse planting box (LED + nutrient solution) -> Requires: seeds, lighting equipment, farming skills
- Advanced: Small hydroponic farm + seed bank -> Requires: stable electricity, professional agricultural knowledge

**Defense Line**
- Starter: Walls + simple roadblocks -> Requires: building materials, manpower
- Intermediate: Watchtower + trap belt + firing ports -> Requires: tools, tactical knowledge
- Advanced: Surveillance system + automated early warning -> Requires: electronic equipment, electricity, technical personnel

**Medical Line**
- Starter: First aid kit + simple quarantine area -> Requires: basic medical supplies
- Intermediate: Operating table + IV equipment + medicine cabinet -> Requires: medical equipment, a doctor
- Advanced: Laboratory (testing/pharmaceutical) -> Requires: specialized equipment, senior medical personnel

#### 2.4 Supplies Status (SuppliesStatus) Dynamic Management

SuppliesStatus is the shelter''s isDynamic field, reflecting overall supply health. When updating it, consider all supply categories holistically:

| Status | Criteria | Recommended Action |
|--------|---------|-------------------|
| Abundant | All categories can sustain 30+ days | Can consider expansion or rescuing others |
| Tight | 1-2 categories dropped below 15 days | Restrict consumption, plan resupply |
| Scarce | Any supply below 7 days | Emergency scavenging or trading mission |
| Depleted | Any critical supply (water/food/medicine) below 3 days | Survival crisis, must act immediately |

---

### 3. Supply Management System

Critical Supplies are entities of the item category; each key supply is documented independently.

#### 3.1 Narrative Positioning of Six Categories

**Food & Water** -- Survival Foundation
- Consumption rate: Fastest; decreasing every day
- Conflict creation: Most direct source of tension ("share or not?" "eat full or ration?")
- Scarcity evolution: Pre-disaster "Ubiquitous" -> First week post-disaster "Common" -> One month later "Rare" -> Long-term "Very Rare"
- Key supply examples: Purified water (5L/jug), military compressed biscuits (200g/pack), canned goods (various), rice (25kg/bag)

**Medical Supplies** -- Lifeline
- Consumption rate: Unpredictable; depends on injury/illness frequency
- Conflict creation: Most extreme moral dilemmas ("only one course of antibiotics left -- who gets it?")
- Scarcity evolution: Pre-disaster "Common" -> Post-disaster "Rare" -> Long-term "Very Rare" -> Certain drugs "Extinct"
- Key supply examples: Broad-spectrum antibiotics (box), painkillers (bottle), bandages/gauze (roll), surgical sutures (set)

**Weapons & Ammunition** -- The Power Scale
- Consumption rate: Burst consumption (one corpse-tide defense can burn through hundreds of bolts)
- Conflict creation: Symbol of power ("whoever controls the weapons makes the rules")
- Scarcity evolution: Pre-disaster "Very Rare" (for civilians) -> Post-disaster even scarcer -> "Extinct"
- Key supply examples: Crossbow bolts (piece), machetes (each), crossbows (each), signal flares (each)

**Survival Tools** -- Construction Foundation
- Consumption rate: Slow, but irreplaceable once broken
- Conflict creation: Functional dependence ("generator broke down -- who can fix it?")
- Scarcity evolution: Pre-disaster "Common" -> Post-disaster "Rare" (no factories producing anymore)
- Key supply examples: Portable generator (unit), solar charging panel (piece), walkie-talkie (pair), toolbox (set)

**Materials & Fuel** -- Operational Lifeblood
- Consumption rate: Moderate; heating and power generation are the major consumers
- Conflict creation: Fuel panic as winter approaches
- Scarcity evolution: Pre-disaster "Ubiquitous" -> Two weeks post-disaster "Common" -> One month "Rare" -> Winter "Very Rare"
- Key supply examples: Gasoline (liter), diesel (liter), steel plates (sheet), cement (bag), lumber (cubic meter)

**Luxury Goods** -- Post-Apocalypse Currency
- Consumption rate: Depends on willpower
- Conflict creation: Trade medium and morale tool
- Scarcity evolution: Pre-disaster "Common" -> Post-disaster "Rare" -> Becomes hard currency
- Key supply examples: Cigarettes (carton), liquor (bottle), chocolate (bar), books (volume), medicinal seeds (bag)

#### 3.2 Phase-Based Scarcity (Rarity) Evolution

When designing a supply''s Rarity, consider the current disaster phase:

| Supply Type | Precursor | Outbreak | Sustained | Subsiding |
|-------------|----------|----------|-----------|-----------|
| Purified water | Ubiquitous | Common | Rare | Rare |
| Canned food | Ubiquitous | Common | Rare | Very Rare |
| Antibiotics | Common | Rare | Very Rare | Extinct |
| Gasoline | Common | Rare | Very Rare | Very Rare |
| Ammunition | Very Rare | Extinct | Extinct | Extinct |
| Table salt | Ubiquitous | Ubiquitous | Rare | Very Rare |
| Seeds | Common | Common | Rare | Very Rare |
| Cigarettes/Alcohol | Common | Rare | Very Rare | Very Rare |

**Narrative application**: When a supply''s Rarity jumps from "Rare" to "Very Rare" or "Extinct," it should correspond to a major plot event -- either the supply chain completely collapsed, a large-scale raid occurred, or natural attrition passed a critical threshold.

#### 3.3 Quantity Consumption Curve Design

Quantity is an isDynamic field. Consider these models when designing consumption curves:

**Linear Consumption**: Daily food and water; fixed daily consumption
- Formula concept: Initial amount - (per-person daily consumption x headcount x days)
- Example: 200 liters of water -> (2L x 4 people x 1 day = 8L) -> 25 days of supply

**Burst Consumption**: Ammunition, medical supplies; almost unused day-to-day but consumed heavily during combat/injuries
- One corpse-tide defense might consume 50 crossbow bolts and 10 rolls of bandages
- One critically injured person might consume an entire box of antibiotics and all surgical consumables

**Diminishing Consumption**: Fuel; usage decreases as conservation awareness grows
- Early: Running generator 8 hours/day
- Mid: 4 hours/day, only when necessary
- Late: 1 hour/day, only for communications and medical equipment

**Critical update points**: Quantity must be updated at these moments --
- After a disaster''s outbreak phase ends (major consumption accounting)
- After a successful scavenging mission (replenishment logged)
- After a supply raid/destruction event (unexpected loss)
- After new members join, changing consumption rates (baseline adjustment)

---

### 4. Character Survival Skills and Moral Alignment

Character Archives are entities of the character category.

#### 4.1 Survival Skill (SurvivalSkill) Complementary Design

A post-apocalyptic survival team must cover at least five skill domains:

| Skill Domain | Included Skills | Consequences of Absence |
|-------------|----------------|------------------------|
| **Combat** | Marksmanship, close combat, tactical command, trap-making | Cannot defend against external threats |
| **Medical** | First aid, surgery, pharmaceutical preparation, disease diagnosis | Injuries and illness untreatable, team attrition |
| **Construction** | Building, electrical repair, welding, mechanical repair | Shelter cannot be upgraded or maintained |
| **Production** | Farming, animal husbandry, cooking, food preservation | Long-term food supply collapses |
| **Reconnaissance** | Driving, map navigation, weather observation, wilderness survival | Field mission success rate extremely low |

**Skill-to-Identity Mapping**:
- Military veteran -> Combat domain (marksmanship, close combat, tactical command) + Reconnaissance (wilderness survival)
- Surgeon -> Medical domain (surgery, first aid, disease diagnosis)
- Construction engineer -> Construction domain (building, electrical repair)
- Agriculture student -> Production domain (farming, food preservation) + Reconnaissance (weather observation)
- Chef -> Production domain (cooking, food preservation)
- Electrician -> Construction domain (electrical repair, welding)
- Nurse -> Medical domain (first aid, pharmaceutical preparation)
- Hunter/Outdoor enthusiast -> Reconnaissance domain (driving, wilderness survival) + Combat (marksmanship)

**Design advice**: The protagonist team should start with an obvious skill gap (e.g., no medical personnel). This gap becomes the narrative motivation for recruiting new members and the entry point for creating crisis scenarios.

#### 4.2 Moral Alignment (MoralAlignment) Conflict Design

This method''s MoralAlignment has only five options. Each option''s behavioral pattern in a post-apocalyptic context:

**Lawful Good**
- Apocalypse creed: "We must preserve our humanity, or surviving is meaningless"
- Typical decisions: Insists on fair supply distribution, takes in the wounded and elderly, never proactively attacks other survivors
- Conflict trigger: When supplies cannot sustain everyone, this kindness becomes a burden on the team

**Neutral Good**
- Apocalypse creed: "I want to help people, but not at the cost of our own survival"
- Typical decisions: Helps survivors who offer exchange value, assists within safe limits, refuses requests that would clearly drag the team down
- Conflict trigger: Where is the line of kindness? Is the "exchange value" criterion itself already unkind?

**True Neutral**
- Apocalypse creed: "Survival is the only principle; everything else is negotiable"
- Typical decisions: Rationally evaluates pros and cons of every decision, not swayed by emotion, willing to make cold but correct choices when necessary
- Conflict trigger: Others find this rationality terrifyingly cold, especially in life-and-death situations

**Chaotic Neutral**
- Apocalypse creed: "Leave me alone, and I''ll leave you alone"
- Typical decisions: Neither actively harms nor actively helps others, behavior is unpredictable, may suddenly leave the group or suddenly return
- Conflict trigger: Teams need stability and trust; this unpredictability is poison for teamwork

**Chaotic Evil**
- Apocalypse creed: "Survival of the fittest"
- Typical decisions: Raids other survivors, betrays teammates for personal gain, maintains control through violence
- Conflict trigger: This is the natural antagonist alignment, but good writing shows how a person slides from goodness to evil step by step

**Alignment Conflict Scenario Templates**:

Scenario 1: A family of three is at the door begging for help
- Lawful Good: We must open the door and take them in
- Neutral Good: First confirm they are not infected, then decide
- True Neutral: Assess whether our supplies can support three more people
- Chaotic Neutral: Not my problem; you all decide
- Chaotic Evil: Search their belongings and turn them away

Scenario 2: Someone in the team has been secretly hoarding supplies
- Lawful Good: One warning, then expulsion if it happens again
- Neutral Good: Understand the motive but the supplies must be returned
- True Neutral: Redesign the distribution system to prevent recurrence
- Chaotic Neutral: I also stashed a little; we are even
- Chaotic Evil: Use it as leverage to control them

---

### 5. Hoarding Narrative Pacing

#### 5.1 Classic Hoarding Story Structure

**Foreknowledge Phase** (5-10% of total)
- Core event: Protagonist learns of impending disaster through rebirth/system/prophetic dream
- Pacing: Fast; protagonist''s psychological shift from doubt to verification to acceptance should be swift
- Key output: Determine the first disaster''s type and timing; establish urgency

**Hoarding Phase** (10-15% of total)
- Core event: Protagonist races against the countdown to purchase and stockpile frantically
- Pacing: Brisk, satisfying rhythm; shopping lists growing, trucks being loaded
- Reader satisfaction: The "hamster hoarding" pleasure of watching supply lists grow
- Key output: Establish main supply entities (item), determine shelter (facility), showcase protagonist''s planning ability

**Catastrophe Strikes** (8-10% of total)
- Core event: First disaster officially erupts
- Pacing: Sudden acceleration; the jarring contrast from daily life to survival mode
- Key output: Create first Disaster Archive (event), set Phase to "Precursor" then advance to "Outbreak"

**Consumption and Management** (15-20% of total)
- Core event: Struggling to survive within the disaster; supplies gradually deplete
- Pacing: Medium-tense; every consumption decision carries weight
- Key output: Quantity continuously decreasing, SuppliesStatus transitioning from "Abundant" to "Tight"

**Resupply Expeditions** (15-20% of total)
- Core event: Supplies insufficient; must risk venturing out to scavenge
- Pacing: Action-adventure rhythm; danger and reward coexist
- Structure advice: Each expedition is a complete mini story arc -- Preparation -> Departure -> Encounter danger -> Acquire supplies -> Return
- Key output: Supply Quantity recovers, possible new member recruitment, new threats discovered

**Expansion and Upgrades** (15-20% of total)
- Core event: Upgrading the shelter, expanding defenses, building new facilities
- Pacing: Base-building management rhythm; gradual sense of achievement as the base strengthens
- Key output: Facilities increase, DefenseLevel rises

**Interpersonal Conflict and Disaster Escalation** (15-20% of total)
- Core event: Internal tensions explode + a new, stronger disaster arrives
- Pacing: Dual-threaded tension -- internal strife and external threats simultaneously
- Key output: MoralAlignment conflicts made explicit, new Disaster Archive (event) created

#### 5.2 "One Supply Run Per Arc" Principle

Each resupply expedition should form a complete narrative arc:

1. **Preparation** (1 chapter): Identify target location, assess risks, distribute equipment, assign guards for the base
2. **Departure and Arrival** (1-2 chapters): Environment description en route and minor encounters
3. **Core Conflict** (2-3 chapters): The main challenge at the target location (other survivors, disaster remnants, building collapse)
4. **Acquisition and Choice** (1 chapter): Supplies found but choices must be made (what to take and what to leave, whether to help people encountered)
5. **Return** (1-2 chapters): Heading back with the haul, possibly pursued or facing new dangers

#### 5.3 Satisfaction Pacing Design

The hoarding genre''s core reader experience is the "preparation -> validation" satisfaction loop:

- Protagonist stockpiled heating supplies -> Extreme cold hits, heating supplies save lives -> Reader gets "prophet superiority" satisfaction
- Protagonist forgot to stockpile a certain category -> Crisis hits, scrambling -> Reader gets "tense excitement"
- Protagonist''s stockpile gets raided -> Hard work wasted, must reacquire -> Reader gets "angry immersion"
- Protagonist scavenges an unexpectedly rare supply -> Resolves an urgent crisis -> Reader gets "surprise delight"

**Key principle**: Satisfaction and setback must alternate. Pure satisfaction becomes boring; pure setback drives readers away.

---

### 6. Tool Usage Guide

**Important reminder: This creation method uses a completely non-standard entity category system.** Below is the correct way to use various tools.

#### 6.1 Viewing Available Entity Types

First, use `get_novel_overview` to view all available module types for the current novel. This method''s visible_categories are ["character", "event", "facility", "item"], which do NOT include the standard setting, scene, prop, or organization categories.

#### 6.2 Operations for Each Entity Type

**Character Archive (entity_category = "character")**
- Creation: You may use the `create_character` tool, since its entity_category is the standard "character"
- Modifying basic fields: Follow the standard procedure from the character operations skill
- Updating dynamic fields (CurrentState, Equipment): Use the `update_field_dynamic_info` tool

**Disaster Archive (entity_category = "event")**
- Creation: Use general module creation tools, specifying the corresponding module_type_id
- Before creation: First retrieve the module_type_id for the event category via `get_novel_overview`, then query its JSON Schema
- Updating Phase: Use the `update_field_dynamic_info` tool -- this is one of the most frequent operations

**Shelter Info (entity_category = "facility")**
- Creation: Use general module creation tools
- Before creation: First query the facility category''s module_type_id and JSON Schema
- Updating SuppliesStatus: Use the `update_field_dynamic_info` tool

**Critical Supplies (entity_category = "item")**
- Creation: Use general module creation tools
- Before creation: First query the item category''s module_type_id and JSON Schema
- Updating Quantity: Use the `update_field_dynamic_info` tool

#### 6.3 Dynamic Field Update Scenario Quick Reference

| Tool | Entity Type | Field | Typical Update Scenario |
|------|-----------|-------|------------------------|
| `update_field_dynamic_info` | Disaster Archive | Phase | Disaster transitions from Precursor to Outbreak, from Outbreak to Sustained, etc. |
| `update_field_dynamic_info` | Shelter Info | SuppliesStatus | After major supply consumption, after successful resupply, after being raided |
| `update_field_dynamic_info` | Critical Supplies | Quantity | After daily consumption accounting, returning from scavenging, after supply loss events |
| `update_field_dynamic_info` | Character Archive | CurrentState | When a character is injured, recovers, or undergoes psychological state changes |
| `update_field_dynamic_info` | Character Archive | Equipment | When a character acquires or loses equipment |

#### 6.4 Schema Query Workflow

Because this method''s entity types are non-standard, before creating any entity, follow these steps:

1. Call `get_novel_overview` to retrieve the current novel''s complete module type list
2. Find the module_type corresponding to your target entity_category (event/facility/item/character)
3. Record its module_type_id
4. Query that module_type''s complete JSON Schema (including all field definitions, enum values, dynamic markers, etc.)
5. Fill in entity data according to the Schema definition for creation',
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
