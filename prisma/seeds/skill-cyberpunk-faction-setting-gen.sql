-- 赛博朋克小说创作 - 「势力格局」设定生成技能
-- 执行方式：mysql -u root -p784784 qritor_dev < prisma/seeds/skill-cyberpunk-faction-setting-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'cyberpunk-faction-setting-gen',
  '「势力格局」设定生成：为赛博朋克小说设计没有好人的权力棋局——巨型企业、街头帮派与地下抵抗如何共同构成主角无处可逃的牢笼',
  '"Faction Landscape" setting generation: design a power chessboard with no good guys — megacorps, street gangs, and underground resistance forming an inescapable cage for the protagonist',
  '## 「势力格局」设定生成 — 赛博朋克小说

赛博朋克的势力设计有一个核心原则：**没有绝对的好人，只有不同程度的坏人**。这不是道德虚无主义，而是叙事现实——每一个势力都有合理的存在逻辑，每一个势力也都在用可怕的方式运作。主角夹在这些势力之间，找不到一个「应该站队」的位置，这才是赛博朋克的政治张力。

---

### 一、巨型企业（Megacorp）设计原则

Megacorp不是「坏公司」——它是把公司逻辑推到极端的产物：追求效率、利润最大化、规避风险，只是没有任何外部约束。

#### 每个Megacorp应该控制一个「领域」

好的设定中，每家企业控制不同的资源/服务，使它们之间产生结构性冲突：

| 控制领域 | 权力来源 | 对普通人的意义 |
|---------|---------|--------------|
| 医疗/生物科技 | 控制生老病死 | 生病了只能选择它的义体/药品 |
| 信息/媒体/网络 | 控制你知道什么 | 现实叙事由它决定 |
| 武器/安保 | 控制暴力的垄断 | 所有的保护都来自它 |
| 食品/能源 | 控制基本生存 | 饿死还是屈服，二选一 |
| 娱乐/文化 | 控制你如何感受 | 逃避现实的渠道也由它设计 |

#### 企业结构的叙事功能

企业不是铁板一块：内部派系、继承人之争、道德异见者，这些都是故事切入点：
- 中层管理者（被企业用完后知道自己会被抛弃）
- 企业的人道主义门面（PR部门告诉你企业在做好事）
- 内部异见者（想改变企业但发现改变不了）

---

### 二、街头帮派——社区，不只是犯罪组织

赛博朋克中的街头帮派不应该只是「犯罪背景」，而是**底层社区在正式权力缺失后自发形成的替代结构**。

**帮派的双重性**：
- 它保护成员，但保护是有代价的
- 它给成员身份认同，但身份认同是一种限制
- 它是企业无法统治的空间，但它用自己的暴力来统治

**帮派类型与叙事用途**：

| 帮派类型 | 文化核心 | 对主角的意义 |
|---------|---------|------------|
| 领地型 | 控制特定街区，维持街区秩序 | 本地联系人，但进出有条件 |
| 意识形态型 | 反企业/反义体/反AI，有明确政治主张 | 潜在盟友，但有极端倾向 |
| 技术型 | 义体改造专家、黑客集体 | 资源来源，但有信息泄露风险 |
| 宗教/cult型 | 围绕某种信仰（包括对AI的崇拜）建立 | 最不可预测，但有时最忠诚 |

---

### 三、地下抵抗势力——为什么抵抗不等于正义

地下反企业势力是赛博朋克的另一个道德陷阱：**它在反对真实的压迫，但它的手段和目的都有问题**。

**地下势力的内部矛盾**：
- 理想主义者（真正相信改变）vs 机会主义者（利用运动谋利）
- 非暴力派 vs 武装抵抗派
- 对人民的态度（保护平民 vs 把平民当棋子）

**最有张力的地下组织类型**：
- 由前企业员工组成（知道内部真相，但方法已经腐化）
- 由AI支持的人类组织（目的一致但权力不对等）
- 自发兴起但被更大势力渗透（好心但已经成了别人的工具）

---

### 四、政府残余——失败的合法性

赛博朋克中政府的残余状态是权力转移的证明：

| 形态 | 表现 | 叙事含义 |
|------|------|---------|
| 名存实亡 | 形式上有法律但无执行能力 | 「你可以去告它，但没有人受理」 |
| 企业代理 | 政府官员都是企业利益代言人 | 合法性是收购来的 |
| 军阀割据 | 不同区域由不同武装力量管控 | 物理位置决定你受什么法律保护 |
| 地下反抗政权 | 声称代表人民，有自己的区域 | 正当性未经验证，可能只是另一个权力结构 |

---

### 五、势力交织——主角无处可逃的结构

最好的势力格局让主角不管选择什么都要付出代价：

**交织方式**：
- 主角为企业做事，同时受帮派庇护——双重义务的冲突
- 主角接到了针对某个势力的委托，但委托方是另一个同样危险的势力
- 主角需要的信息在多个势力手里各有一部分
- 主角的个人关系（朋友/恋人/家人）分散在不同势力中

---

### 六、常见错误

- ❌ 企业=坏人，抵抗=好人——这是最无聊的赛博朋克
- ❌ 每个势力只有一种声音——势力内部的分歧比势力间的冲突更有叙事价值
- ❌ 帮派只是犯罪背景，没有文化身份和内部逻辑
- ❌ 主角可以在势力之间自由选边——好的故事结构让「不选边」也有代价
- ❌ 势力太多记不住——核心势力3-4个足够，支线势力按需添加',
  '"Faction Landscape" Setting Generation — Cyberpunk Fiction

Core principle: no absolute good guys, only varying degrees of bad ones. Every faction has rational self-justification and is simultaneously running on something terrible. The protagonist finds no side to join without cost — this is the political tension of cyberpunk.

**Megacorp design**: each corp controls one domain (medical controls life and death; media controls reality; weapons controls violence monopoly; food/energy controls survival; entertainment controls escape). Corporations are not monolithic — internal factions, succession struggles, internal dissenters are all story entry points.

**Street gang design**: not just criminal background, but substitute social structure formed in the absence of formal authority. Double nature: protects members (but protection has a price); provides identity (but identity is a constraint); represents space outside corporate control (but governed by its own violence). Four gang types: territorial (local safety, conditional access); ideological (anti-corp agenda, extremist tendencies); technical (ripperdoc collectives, hacker groups); religious/cult (most unpredictable, sometimes most loyal).

**Underground resistance**: fighting real oppression but compromised methods. Internal tensions: idealists vs. opportunists; nonviolent vs. armed faction; protecting civilians vs. using them as pawns.

**Most powerful faction network design**: forces the protagonist to choose between options where every choice has a cost. Information split between hostile factions; personal relationships distributed across opposing sides; dual obligations (corp work + gang protection) collide.',
  (SELECT id FROM novel_creation_method WHERE name = '赛博朋克小说创作' LIMIT 1),
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
