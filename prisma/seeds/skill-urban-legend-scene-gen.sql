-- 都市传说怪谈复苏流小说 - 「都市场景」生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-urban-legend-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'urban-legend-scene-gen',
  '「场景」生成：为都市传说怪谈复苏流小说设计承载恐惧的现代都市空间',
  '"Scene" generation: design modern urban spaces that carry horror for urban legend revival horror novels',
  '## 「场景」生成 — 都市传说怪谈复苏流小说

都市怪谈的场景设计有一个反直觉的原则：**越日常的空间，异变后越恐怖**。读者对废弃鬼屋有心理准备；但对自己昨天刚经过的便利店洗手间没有心理防线。好的场景设计利用的不是陌生感，而是熟悉感的背叛——它让读者在下次经过类似地方时，想起这个故事。

---

### 字段生成指南

#### 场景名称
场景名称要具体而非泛化：

| 弱（太泛化） | 强（具体而真实） |
|-----------|--------------|
| 某个电梯 | 23号楼的负一层电梯 |
| 地铁站 | 3号线末站站台的最右边 |
| 医院走廊 | 旧楼六层手术室外的走廊 |
| 便利店 | 小区门口24小时营业的全家 |

具体的名称让场景感觉像「某个真实存在的地方」，而不是舞台布景。

#### 场景类型
八种场景类型在都市怪谈中各有不同的恐怖机制：

| 类型 | 核心恐怖机制 | 密闭性 | 可退出难度 |
|------|-----------|-------|----------|
| 地铁/公共交通 | 移动中的密闭空间，无法自主控制目的地 | 极高 | 极高（门会关闭） |
| 电梯/楼道 | 垂直方向的迷失，熟悉空间的背叛 | 高 | 高（楼层失控） |
| 医院/诊所 | 生死边界的模糊，权威空间的失效 | 中高 | 中（有出口但有理由不能离开） |
| 废弃建筑 | 时间叠加，遗留的人类痕迹 | 低 | 中（物理上可以离开但内容驱使留下） |
| 公寓/住宅 | 最私人空间的侵入，「家」的安全感崩溃 | 高 | 低（你必须住在这里） |
| 便利店/商场 | 公共空间的夜晚，灯光与孤立的反差 | 低 | 低（门开着，但出去是更危险的地方） |
| 学校/图书馆 | 知识权威与未知的冲突，熟悉场所的陌生化 | 中 | 中 |
| 网络/虚拟空间 | 无处可躲，规则失效的信息空间 | 无物理密闭 | 极低（但无法真正关机） |

**场景选择建议**：根据故事的主要角色职业来选择场景——外卖员应该有大量电梯/楼道场景；地铁乘客应该有公共交通场景。场景与角色的日常应当有自然的交汇。

#### 现实描述
现实描述是建立「熟悉感」的关键步骤，也是恐惧的准备工作。

**好的现实描述包含**：
- **感官细节**：灯光颜色（日光灯/暖光/闪烁）、声音（空调嗡嗡声、地铁的隆隆声）、气味（消毒水/外卖味道/潮湿）
- **时间特征**：这个地方在白天/深夜的不同状态
- **常见人物**：通常会在这里遇到什么样的人
- **已有的不舒适感**：即使在正常状态下，这个地方也有某些让人略感不适的元素（灯光太亮、回声太响、某个角落总是有怪味）

**写作技巧**：在现实描述阶段，预埋一个「不起眼的细节」，在后续异变特征中被激活。读者第一次读到时没察觉，回头翻看才发现那时候就已经不对了。

#### 异变特征
异变特征是从「熟悉」到「不对」的转折点，也是这个场景核心的恐惧内容。

**都市场景异变的三种层级**：

```
表层异变（感官层面，最先被注意到）：
  - 电梯：地板反光消失，镜子里的影子比自己慢了半秒
  - 地铁：报站的声音变成了无法辨认的词语
  - 便利店：收银台后的员工不眨眼，也不说话

中层异变（空间/规则层面，需要意识到才恐惧）：
  - 电梯：负一层变成了负三层，而这栋楼根本没有负三层
  - 地铁：这列车在地图上不存在的站台停了下来
  - 便利店：走出去后重新走进来，商品变了，但员工说你刚才没有离开过

深层异变（本质层面，揭示后最恐惧）：
  - 电梯：它一直都是正常的，是你自己今晚进了错误的楼
  - 地铁：这列车是真实的，但它承载的乘客里有一个不是活人
  - 便利店：你离开后的那段时间，时钟显示只过了2分钟，但外面的天已经亮了
```

生成时，为每个场景提供所有三个层级的异变特征，供叙事推进参考。

#### 触发条件
场景的触发条件要与整个故事的核心规则保持一致，同时有场景专属的细节：

**触发条件的四个维度**：
- **时间维度**：深夜凌晨/特定时段/某个时间循环
- **人数维度**：独自一人/恰好两个人/超过某个数量/某种组合
- **行为维度**：特定的动作（按错楼层、说了某个词、看了不该看的方向）
- **状态维度**：疲劳/恐惧/清醒/某种情绪峰值

**最有效的触发条件**是上述多个维度的组合，且至少有一个维度是「人性弱点」——人们在疲劳时容易犯的错、在慌张时做的事。

#### 逃脱线索
逃脱线索是读者在阅读时与主角一起「解谜」的信息，也是生存恐怖的核心乐趣：

**好的逃脱线索特征**：
- 在场景的现实描述中已经被埋设（回头看：「这里本来就有提示」）
- 需要主角付出代价才能获取（不是「随手就看到了」）
- 可能是误导性的（线索指向的方法不一定奏效）
- 本身也带来新的问题（「找到线索」同时意味着「接触了危险」）

#### 当前状态
当前状态是动态字段，记录场景在故事推进中的变化：
- 危险等级：刚触发/活跃/暂时平静/已被「处理」（但方式可疑）
- 知情范围：只有主角知道/小范围传开/官方已介入
- 物理状态：封锁中/正常运营（最恐怖的状态）/已废弃

---

### 场景阵容建议

**标准场景配置（5个场景）**：
1. 主角日常空间（公寓/住宅）：恐惧的起点，私人空间被侵入
2. 日常通勤场景（地铁/电梯）：规律行为变成触发点
3. 边界场景（废弃建筑/医院）：调查线的核心地点
4. 意外卷入场景（便利店/商场）：原本是安全的，后来不是了
5. 终局场景：整合所有线索的最终地点，不要过早设计

---

### 与已有设定的联动

- **场景类型 → 禁忌规则的触发条件**：场景的核心特征（密闭性、时间性）应该在规则触发条件中有所体现
- **现实描述的预埋细节 → 逃脱线索**：现实描述中的某个「普通」细节可以成为逃脱线索
- **异变特征的深层变体 → 禁忌规则的未知层级**：两者的「最深层真相」应该互相印证

---

### 常见错误

- ❌ 场景只有「外观上不对」，没有规则层面的异变——缺乏逻辑深度
- ❌ 触发条件太苛刻（「独自+凌晨3点+穿白色衣服+倒着走」），主角不可能无意中违反
- ❌ 所有场景的恐惧机制雷同，都是「门关了出不去」
- ❌ 逃脱线索太明显，主角第一眼就能看到
- ❌ 「网络/虚拟空间」场景没有解释如何处理「关机即可离开」的逻辑漏洞',
  '"Scene" Generation — Urban Legend Revival Horror Novels

Core principle: the more mundane the space, the more terrifying its corruption. Readers have psychological defenses for haunted houses; they have none for the convenience store bathroom they visited yesterday.

**Horror mechanism by type**:
- Subway/transit: mobile sealed space, no self-control over destination
- Elevator/corridor: vertical disorientation, betrayal of familiar space
- Hospital/clinic: blurring of life/death boundary, failure of authority space
- Abandoned building: accumulated time, lingering human traces
- Apartment/home: invasion of most private space, collapse of the "home = safe" axiom
- Convenience store/mall: night-time public space, contrast between bright lights and isolation
- School/library: conflict between knowledge authority and the unknown
- Network/virtual space: no physical exit, unable to truly disconnect

**Three levels of corruption**:
1. Surface (sensory): elevator floor reflection gone, mirror shadow half a second behind
2. Middle (spatial/rule): the elevator opens to a floor that doesn''t exist in this building
3. Deep (essential): the elevator was always normal — you entered the wrong building tonight

**Effective trigger conditions** combine multiple dimensions: time (late night, specific hours), count (alone, exactly two people), behavior (pressing wrong floor, saying a word, looking the wrong direction), and state (exhausted, panicked) — with at least one dimension being a human-nature vulnerability.

**Good escape clues**: pre-embedded in the "normal" description (retrospective revelation), require cost to obtain, may be misleading, themselves create new danger.

**Standard 5-scene lineup**: protagonist''s home (fear origin, private space violated), commute scene (routine becomes trigger), boundary space (investigation core), accidental scene (was safe, then wasn''t), final scene (integrates all clues — don''t design too early).',
  (SELECT id FROM novel_creation_method WHERE name = '都市传说怪谈复苏流小说' LIMIT 1),
  1,
  22,
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
