-- 未来科幻穿越创作「科幻角色」生成技能（Layer 3 领域知识层）
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1)
-- 执行方式 / Usage: mysql -u <user> -p <database> < skill-scifi-crossing-character-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'scifi-crossing-character-gen',
  '「角色」生成：为未来科幻穿越创作生成科幻角色，涵盖多种生命形态（人类/义体/AI/外星）、科技背景下的身份设计、阵营归属',
  '"Character" generation: generate sci-fi characters for future sci-fi crossing novels, covering multiple life forms (human/cyborg/AI/alien), tech-contextualized identity design, and faction affiliation',
  '## 「角色」生成 — 未来科幻穿越创作

未来科幻穿越小说的角色设计核心是**生命形态多样性 × 科技对人性的重塑 × 阵营博弈**。穿越者进入一个科技远超当代的未来世界，角色的生命形态（纯人类、改造人、AI、外星种族）直接定义其世界观和行为逻辑。

科幻角色的独特之处在于：科技模糊了"人"的边界——义体改造人还算人类吗？强AI有意识吗？这些哲学问题是角色设计的深层维度。

---

### 字段生成指南

#### 姓名

- 纯人类：可用现代或未来化的名字
- 义体改造人：本名 + 可能有代号（姓名字段填本名）
- AI/仿生人：可以是代号（如"ARIA-7"）或自选人类名
- 外星种族：异域化命名，可配合音译效果
- 意识体：可以是概念性的称呼

#### 生命周期

三个选项的科幻语境：

| 周期 | 说明 | 适用角色 |
|------|------|---------|
| **长期** | 贯穿全书的核心角色 | 主角、核心盟友、终极反派 |
| **短期** | 单个事件弧中出现并退场 | 任务中的联络人、牺牲的同伴 |
| **客串** | 提供信息或触发事件后消失 | 线人、AI助手、路人 |

#### 种族/形态

六个选项的设计要点：

| 形态 | 核心特征 | 角色设计侧重 |
|------|---------|------------|
| **纯人类** | 未经改造的自然人 | 在科技世界中的"原始"存在感，可能被歧视或自豪 |
| **义体改造人** | 部分或大量机械改造 | 人性与机械的边界问题；改造越多，"人味"越少 |
| **基因强化人** | 基因层面的优化 | 设计婴儿、超级士兵等伦理问题 |
| **强AI/仿生人** | 人工智能或仿生体 | 是否有真正的意识？与人类的关系是服务还是平等？ |
| **外星种族** | 非地球生命 | 完全不同的思维方式和价值观 |
| **意识体** | 纯数字化存在 | 脱离肉体的存在方式，对"生命"的重新定义 |

穿越者通常以纯人类形态进入，但可能在故事中进行改造。

#### 阵营/所属势力

- 参考「科幻世界观」中的势力分布
- 常见阵营类型：星际联邦/企业集团/反抗组织/海盗/独立势力
- 穿越者初期可能无阵营，逐步选择或被迫加入
- 阵营立场不必非黑即白

#### 职业/身份

科幻世界的职业体系：
- 军事：星舰舰长、特种兵、雇佣兵
- 技术：黑客、工程师、科学家、AI训练师
- 社会：企业高管、政客、记者、赏金猎人
- 边缘：走私商、星际海盗、流浪者
- 职业要与角色的种族/形态匹配

#### 核心技能/装备

科幻角色的能力来源：
- 纯人类：主要靠装备和技能（战斗服、武器、飞船）
- 义体改造人：植入体赋予的超人能力（义眼、神经加速器、武器臂）
- AI/仿生人：计算能力、网络入侵、多任务处理
- 外星种族：种族天赋（心灵感应、能量操控等）
- 技能/装备要与「科技与设定」中的科技水平一致

#### 性格特征

科幻角色的性格受生命形态影响：
- 纯人类：最"正常"的情感反应，可作为读者代入点
- 改造人：可能存在身份认同危机（"我还是人吗"）
- AI/仿生人：逻辑驱动但可能发展出情感（核心冲突）
- 外星种族：完全不同的价值体系和情感模式
- 穿越者：用现代人视角审视未来世界的不合理之处

#### 核心驱动力

角色的目标和欲望：
- 穿越者：生存/回归/改变这个世界/寻找穿越真相
- 改造人：寻找人性/完成终极改造/脱离控制
- AI：理解情感/获得自由意志/完成使命
- 反派：控制资源/推行理念/种族至上主义

---

### 角色阵容建议

**标准配置**：
1. **主角**：穿越者（纯人类），科技知识为零但有独特视角
2. **科技盟友**：义体改造人或黑客，弥补主角的科技短板
3. **非人类角色**：AI伙伴或外星盟友，带来完全不同的视角
4. **反派**：企业高管或军方强者，代表这个世界的既定秩序
5. **灰色角色**：立场模糊的赏金猎人或信息掮客

---

### 与已有设定的联动

| 设定模块 | 对角色的影响 |
|---------|------------|
| **穿越设定** | 穿越方式→主角进入未来世界的方式；穿越者身份→主角的知识储备 |
| **科幻世界观** | 星际格局→阵营选择；种族关系→角色间的种族张力 |
| **科技与设定** | 科技水平→装备和改造的上限；AI发展程度→AI角色的智能水平 |

---

### 常见错误

1. **科技水平不一致**：角色装备超出「科技与设定」定义的科技水平
2. **所有角色都是人类**：浪费了科幻世界的生命形态多样性
3. **AI角色过于人类化**：强AI如果表现得和人类完全一样，失去了探讨意识问题的机会
4. **穿越者适应太快**：从现代穿越到未来，应有科技冲击和适应过程
5. **阵营过于简单**：好人组织 vs 坏人组织的二元对立，缺乏灰色地带
6. **忽视形态对行为的影响**：义体改造人和纯人类的行为模式应有显著差异',
  '## "Character" Generation — Future Sci-Fi Crossing Novel

The core of character design in future sci-fi crossing novels is **life form diversity × technology reshaping humanity × faction politics**. The transmigrator enters a world with technology far beyond the present. A character''s life form (pure human, cyborg, AI, alien) directly defines their worldview and behavioral logic.

What makes sci-fi characters unique: technology blurs the boundary of "human" — are heavily modified cyborgs still human? Do strong AIs have consciousness? These philosophical questions are deeper dimensions of character design.

---

### Field Generation Guide

#### Name (姓名)
Pure humans: modern or futuristic names. Cyborgs: real name + possible codename. AI: designation or self-chosen name. Aliens: exotic naming. Consciousness entities: conceptual titles.

#### Life Cycle (生命周期)
Long-term (core characters), Short-term (single arc), Cameo (information providers).

#### Race/Form (种族/形态)
Six options: Pure Human (natural, "primitive" in tech world), Cyborg (humanity vs machine boundary), Gene-Enhanced (designer babies, super soldiers), Strong AI/Android (consciousness question), Alien Race (entirely different thinking), Consciousness Entity (digital existence).

#### Faction (阵营/所属势力)
Reference sci-fi worldview''s power distribution. Common types: stellar federation, corporate group, resistance, pirates, independents.

#### Profession (职业/身份)
Military (captain, soldier, mercenary), Technical (hacker, engineer, scientist), Social (executive, politician, bounty hunter), Fringe (smuggler, pirate, drifter).

#### Core Skills/Equipment (核心技能/装备)
Ability sources vary by life form. Must align with tech level in "Technology & Setting."

#### Personality (性格特征)
Life form influences personality: pure humans have "normal" emotions; cyborgs may have identity crises; AI are logic-driven but may develop emotions; aliens have entirely different value systems.

#### Core Drive (核心驱动力)
Character goals: transmigrator (survival/return/change the world), cyborg (finding humanity), AI (understanding emotions/gaining free will), antagonist (controlling resources/ideology).

---

### Setting Linkage

| Setting | Impact |
|---------|--------|
| **Crossing Setup** | How protagonist enters; knowledge base |
| **Sci-Fi Worldview** | Interstellar landscape → faction choices; racial relations → inter-character tension |
| **Technology & Setting** | Tech level → equipment/modification ceiling; AI development → AI character intelligence |

---

### Common Errors

1. **Tech level inconsistency**: Equipment beyond defined tech level
2. **All characters are human**: Wasting sci-fi life form diversity
3. **Over-humanized AI**: Strong AI behaving exactly like humans misses consciousness exploration
4. **Transmigrator adapts too quickly**: Should show tech shock and adaptation process
5. **Oversimplified factions**: Binary good vs evil without gray areas
6. **Ignoring form''s behavioral impact**: Cyborgs and pure humans should behave noticeably differently',
  (SELECT id FROM novel_creation_method WHERE name = '未来科幻穿越创作' LIMIT 1),
  1,
  21,
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
