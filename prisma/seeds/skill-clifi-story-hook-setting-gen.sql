-- Cli-Fi / Climate Fiction Novel「Story Hook」生成技能
INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'clifi-story-hook-setting-gen',
  '生成「Story Hook」：为气候幻想小说设计核心危机、幸存者开局和远大目标',
  'Generate "Story Hook": Design the immediate crisis, survivor''s opening, and grand goal for Cli-Fi fiction',
  '## 「Story Hook」生成 — 气候幻想 (Cli-Fi)

气候幻想的开局必须立刻把读者抛入一个**资源极度匮乏、环境极其致命**的绝境中。主角的初始动力往往非常纯粹：活下去，或者找水/找空气。

### 字段生成指南

#### Story Hook
- 一句话概括：极端环境 + 主角的低微身份/处境 + 改变命运的发现。
- 示例："在一个海平面上升淹没文明的世界，一个专门潜入摩天大楼废墟寻找旧时代净水芯片的拾荒者，意外找到了一张标有最后一片干旱大陆的地图。"

#### Environmental Catalyst (环境催化剂)
- 迫使主角立刻采取行动的灾难性气候事件。
- 必须具有倒计时般的紧迫感。
- 比如：一场长达十年的"超级沙暴"即将吞没他们最后的绿洲；或者地下避难所的氧气循环系统将在72小时后彻底停机；又或者是导致海洋酸化的未知藻类开始疯狂繁殖。

#### Opening Tension (开局冲突)
- 着眼于微观的生存危机。
- 比如：主角用命换来的水被当地的水霸王没收了；或者在废墟搜刮时，呼吸面罩的过滤芯被变异野兽撕裂。

#### Reader Expectation (读者期待)
- 读者希望在如此压抑的世界中看到一丝希望或者爽快的反抗。
- 预期：主角最终推翻了囤积资源的寡头统治（Dystopian overthrow），或者他们真的跨越了死亡沙海，找到了传说中充满绿色植物的"伊甸园"（Eden）。',
  '## "Story Hook" Generation — Cli-Fi

The opening of Climate Fiction must immediately throw the reader into a desperate situation where **resources are extremely scarce, and the environment is deadly**. The protagonist''s initial motivation is entirely pure: to survive, or to find water/air.

### Field Generation Guide

#### Story Hook
- One sentence: Extreme environment + protagonist''s lowly status/situation + a destiny-altering discovery.
- Example: "In a world where rising sea levels drowned civilization, a scavenger who dives into flooded skyscrapers looking for old-world water purification chips accidentally finds a dry map to the last continent."

#### Environmental Catalyst
- A catastrophic climate event forcing immediate action.
- Must feel like a ticking clock.
- For example: A decade-long "Mega-Storm" is about to engulf their final oasis; the oxygen cycler in their underground bunker will permanently fail in 72 hours; or an unknown, acidifying algae is rapidly blooming across trading routes.

#### Opening Tension
- Focus on a micro-level survival crisis.
- For example: The water the protagonist risked their life for is confiscated by a local Water Baron; or during a scavenging run, the filter of their breathing mask is damaged by a mutated beast.

#### Reader Expectation
- Readers want to see a glimmer of hope or satisfying rebellion in such an oppressive world.
- Expectation: The protagonist eventually overthrows the oligarchs hoarding resources (Dystopian overthrow), or they actually cross the sea of death and find the legendary "Eden" filled with green plants.',
  (SELECT id FROM novel_creation_method WHERE name = 'Cli-Fi / Climate Fiction Novel' LIMIT 1),
  1,
  1,
  NOW()
)
ON DUPLICATE KEY UPDATE description = VALUES(description), instructions = VALUES(instructions);
