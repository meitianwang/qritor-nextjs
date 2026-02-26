-- Paranormal Forensics Novel「Crime Scene」generation skill (Layer 3 domain knowledge)
-- novel_creation_method_id = (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1)
-- Usage: mysql -u <user> -p <database> < skill-foren-scene-gen.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'foren-scene-gen',
  '「Crime Scene」生成：为超自然法证小说设计调查现场——每个场景必须同时携带专业级的常规法证证据与精确定义的超自然异常，二者之间的矛盾张力是调查叙事的核心驱动力',
  '"Crime Scene" generation: design investigation locations where professional-grade conventional forensic evidence and precisely defined paranormal anomalies coexist in productive contradiction — that tension is the genre''s primary narrative engine',
  '## 「Crime Scene」生成 — 超自然法证小说

超自然法证类型的核心叙事设备：现场是调查者进入谜题的入口，也是读者理解这个世界运作规则的教室。设计现场的失败会以两种方向发生：要么常规法证太弱，无法建立专业可信度；要么超自然异常太模糊，无法产生真实的认知冲突。两种失败都会破坏这类小说最重要的效果——让「不可能」在专业证据的包围中变得无可辩驳。

---

### 字段生成指南

#### Location Name（地点名称）

名称应传递具体的地理和功能信息。不要写「废弃工厂」，而是「前林福兄弟化工厂，第3号生产楼，二层」。具体的命名建立了现实感，也为现场历史的研究提供了钩子。

#### Setting Type（场景类型）

九种类型，每种对超自然调查具有独特的叙事特性。见下方详细设计指南。

#### Physical Environment（物理环境）

物理环境不是背景描述，而是建立调查基线的技术文件。需要涵盖：
- **布局**：空间的物理结构——哪些区域可进入，哪些被封锁，通道关系
- **状态**：环境的当前条件——光线、气温、气味、声学特性
- **扰动迹象**：什么被移动过、破坏过、清理过或刻意保留
- **时间因素**：事件发生时的时间与现在的时间差，以及这对证据状态的影响

物理环境的细节应该支撑或与「常规法证证据」和「超自然异常」两个字段产生联系。

#### Conventional Forensic Evidence（常规法证证据）

这是整个现场设计中最需要技术精度的字段。见下方专项讨论。

#### Paranormal Anomalies（超自然异常）

这是整个现场设计中需要最精确想象力的字段。见下方专项讨论。

#### History of the Location（地点历史）

说明地点过去发生了什么，以及这与当前案件的关系。设计原则：历史应该增加深度，而不是提供简单答案。最好的地点历史包含与当前案件类似但不相同的事件——足够相关，让调查者看出模式；又足够不同，让简单类比失效。

#### Witness Accounts（目击者陈述）

目击者陈述的价值在于它与物理证据的冲突，而非一致。如果陈述与证据完全吻合，就没有调查张力。设计目击者陈述时，找到这个特定现场最令人不安的矛盾：他们描述了什么，而证据表明了什么，这两者如何无法同时为真？

#### Key Investigative Questions（关键调查问题）

这个字段定义现场在叙事中的认识论功能——它揭示了什么，它拒绝揭示什么。好的调查问题不是「谁干的」，而是「这种伤口模式在物理上是如何造成的」、「为什么所有电子设备在同一时间停止工作」、「那个人在事件发生时是否真的在场，如果不是，那个在场的是什么」。

---

### 九种场景类型的设计特性

#### 1. Residential（住宅：家庭/公寓）

住宅现场的核心叙事特性是**亲密性与入侵的对比**。家是人类建立控制感和安全感的地方——超自然事件在这里发生意味着任何地方都不安全。

**常规法证的独特性**：住宅充满个人物品、日常生活痕迹、家庭成员的物证层叠。这些材料可以重建受害者的日常生活，揭示他们的关系、习惯、恐惧。血液、头发、纤维、足迹——住宅中的每件物品都可能是证据。

**超自然异常的独特性**：住宅异常通常与领域性和习惯性相关——某个房间始终比其他房间冷，某个物品被反复移动到相同位置，居住者的行为模式发生了无法解释的改变。异常往往与居住者的个人历史相关。

**设计重点**：谁住在这里，他们与这个地方的关系，以及异常是如何融入日常生活的（甚至没有被注意到）。

#### 2. Medical Facility（医疗机构）

医疗机构现场的核心叙事特性是**记录系统与超自然的碰撞**。医院和诊所维护着精密的记录系统，包含时间戳、医疗数据、工作人员日志——这使超自然事件在这里特别可被记录，也特别可被否认。

**常规法证的独特性**：病历、用药记录、生命体征监测数据、监控录像（通常是最密集的）、工作人员的多层次证词（医生、护士、技师的陈述可能有显著差异）。医疗设备本身也是证据——设备异常可能具有技术上的可追踪性。

**超自然异常的独特性**：医疗记录可能显示生理上不可能的数据（心率在设备正常工作时测到异常值，药物浓度与给药量不符）。已故患者在记录中显示的活动，或者所有记录系统在特定时刻同步停止。

**设计重点**：文件系统的细节——什么被记录了，什么应该被记录但没有，以及谁有权限修改记录。

#### 3. Industrial/Abandoned（工业/废弃场所）

废弃工业场所的核心叙事特性是**隔离性与历史积累**。没有日常的人类存在来「干扰」现场——但也没有持续的监视和证人。

**常规法证的独特性**：物证在这里可以保存极长时间（隔绝外部扰动），但也可能被工业化学品、腐蚀和结构衰退破坏。年代层次是这里特有的法证挑战——区分近期事件证据与数十年前的历史残留。

**超自然异常的独特性**：工业场所的超自然现象往往与该地点的历史事件（工业事故、劳工悲剧、环境污染）有关。建筑结构的损毁方式——哪些结构在不应该的情况下完好，哪些在没有明显外力的情况下坍塌——可以是超自然的痕迹。

**设计重点**：该设施的运营历史和停运原因，以及与当前案件可能的历史关联。

#### 4. Public Space（公共空间）

公共空间的核心叙事特性是**大量潜在证人与证词可靠性的根本问题**。数十或数百人可能在场，但公共场所的混乱和人们对异常情况的心理否认机制，使得多目击者证词往往高度矛盾。

**常规法证的独特性**：大量监控摄像头（但覆盖可能有盲区），交通记录，手机定位数据，支付记录——数字证据密度极高。实物证据则相反——被大量人流破坏和混合。

**超自然异常的独特性**：在公共场所，异常可以是集体性的——大量人同时经历了无法解释的事情，但每个人的描述都不同。或者相反，视频记录了某件明确发生的事情，而所有在场者都声称没有注意到。

**设计重点**：数字记录系统的具体状态，以及异常如何在公共目击的条件下仍然保持了可否认性。

#### 5. Natural Environment（自然环境）

自然环境的核心叙事特性是**法证技术的局限性暴露**。常规法证实践是针对人工环境发展的——在野外，许多标准程序的适用性大大降低。

**常规法证的独特性**：痕迹证据（脚印、植被扰动）、环境数据（天气记录、野生动物活动）、地质样本。但时间因素尤其关键——自然环境会以可预测的速度改变证据。

**超自然异常的独特性**：植被模式（不按季节生长或死亡，以特定几何形状）、动物行为异常（完全不应该出现某种动物的地方出现了，或者当地动物集体回避某个区域）、地质异常（土壤分析显示化学成分不可能）。

**设计重点**：调查的技术难度——没有可控环境，没有监控录像，自然力量持续改变证据状态。

#### 6. Religious Site（宗教场所）

宗教场所的核心叙事特性是**象征意义密度与超自然现象的交叠**。宗教建筑本来就充满了「设计为与超自然建立联系」的元素——这使得区分刻意的宗教符号学与真实的超自然迹象成为一个真实的调查挑战。

**常规法证的独特性**：宗教场所通常有精心维护的历史记录，可追溯数十到数百年。物理结构可能包含隐藏空间（密室、地下室、内室）。多代信众留下的物品层叠提供了异常复杂的物证背景。

**超自然异常的独特性**：在已经「设计为与超自然联系」的空间里，超自然迹象必须以具体的、无法被宗教文本或仪式实践解释的方式显现，才能在调查者的分析中被区分出来。

**设计重点**：这个宗教团体的历史，以及当前事件是否与其历史中的特定事件或文本形成了令人不安的平行。

#### 7. Government/Institutional（政府/机构场所）

政府机构场所的核心叙事特性是**机构性证据控制**。在这里发生的事件，其证据系统性地被机构自身的运作所管理、过滤和潜在地掩盖。

**常规法证的独特性**：访问日志、身份验证记录、内部通信——留下的文件痕迹可以极其详尽。但清除这些记录的能力也在同一个机构内部。

**超自然异常的独特性**：机构场所的超自然现象经常围绕着该机构正在做的事情——特别是如果该机构涉及机密研究、敏感档案或非公开活动。异常可能指向机构活动的性质，而不仅仅是超自然本身。

**设计重点**：机构阻挠如何与调查者获取证据的努力互动，以及证据破坏是在事件之前、期间还是之后发生的。

#### 8. Vehicle or Transit（交通工具或运输节点）

交通工具现场的核心叙事特性是**移动性与密闭性的结合**。事件发生在一个既可以移动、又是密封空间的环境中——这对事件时序和可能的施因者有显著的法证含义。

**常规法证的独特性**：车辆内部是高度可控的微环境，痕迹证据可以非常精确。GPS数据、行驶记录、速度和制动日志、内部摄像头——技术记录密度高。

**超自然异常的独特性**：车辆在行驶中停止（所有系统同时失效）、乘客的集体经历无法被任何机械故障解释、目的地的变化——或者更令人不安的，精确到秒的时间线显示了物理上不可能发生的事件顺序。

**设计重点**：移动性意味着「现场」是可移动的，而密闭性意味着每个在场者都是重要证人。

#### 9. Other（其他）

其他场景类型应该使用上述分析框架来定义其独特的法证特性和超自然潜力，并填写该类型特有的设计说明。

---

### 双证据原则：这是最关键的设计规则

**每个现场必须同时包含常规法证证据和超自然异常，并且两者都必须具体和详细——不能含糊、不能通用。**

这个原则的存在是因为：超自然法证类型的核心戏剧效果来自于两套证据系统之间的张力——一套指向常规解释，另一套指向不可能的解释，而两套证据都来自同一个现场，都是真实的。如果任何一方过于薄弱，整个结构就会坍塌。

---

### 设计常规法证证据

**专业标准**：法证证据描述必须达到专业可信度，而不是犯罪电视剧的视觉化简化。

错误示例：「发现血迹」
正确示例：「北墙发现动脉喷溅血迹，喷溅模式表明受害者在受创时站立，高度与门把手齐平；受创方向为右侧外力；然而地面上没有发现任何接触痕迹，除受害者之外，无法确认第二人在场的物理证据」

**法证证据必须包含什么**：
- **具体的物证描述**：不是「发现证据」，而是「发现什么，在哪里，状态如何」
- **法证分析的发现**：证据经过专业分析后得出的结论
- **法证分析无法解释的部分**：这是向超自然异常过渡的桥梁——不是「什么都没发现」，而是「发现了这个，但这个在物理上意味着X，而X是不可能的」

**常见法证类型及其叙事功能**：
- **血迹分析**：喷溅模式重建事件序列，揭示力量来源、方向、时序
- **痕迹证据**（毛发、纤维、足迹）：建立谁在场，但在超自然案例中，「谁」可能需要重新定义
- **法医毒理学**：体液分析揭示药物、毒素、异常物质——或者揭示本不应该在那里的物质
- **死亡原因分析**：尸检发现，包括伤口特征、死亡时间、死因——在超自然案例中，尸检发现通常是谜题的核心
- **数字法证**：设备记录、通信记录、时间戳——在超自然案例中，数字证据的异常（时间戳不一致、加密失效、数据自行修改）是特别有效的桥梁证据

---

### 设计超自然异常

**精确的不可能**：超自然异常必须是精确定义的，而不是模糊的恐惧感。它的力量来自于它与现有法证证据的具体矛盾。

错误示例：「现场感觉很奇怪」
正确示例：「血液样本的DNA分析返回了三组不同的DNA序列，均匹配受害者的序列，但线粒体DNA显示细胞年龄差异跨越数十年；受害者为34岁，但部分组织样本的细胞衰老标记物与70岁以上个体相符，而其他样本则与儿童相符」

**超自然异常的类型与其叙事功能**：

- **时间性异常**（死亡时间无法确定；物证显示的时序与可能性不符）：挑战法证最基础的能力——重建时间线
- **空间性异常**（伤口来自物理上无法达到的角度；物品出现在密封空间中）：挑战物理因果链
- **生理性异常**（不可能的死因；生理状态在医学上无法解释）：挑战医学和病理学的解释框架
- **数据性异常**（设备记录了不应该存在的内容；时间戳在不可能被修改的情况下被修改）：挑战数字证据的客观性
- **见证性异常**（多名独立目击者描述了相同的不可能事件；或者没有任何目击者，但证据显示现场有大量活动）：挑战证词的可靠性

**异常必须具体、可测量、并直接与常规法证证据冲突**——不是「令人不安」，而是「技术上不可能，且不可能性可以被精确描述」。

---

### 地点历史的运用

地点历史的功能是**增加深度，而不是提供答案**。设计原则：

- 历史必须与当前案件相关，但不能是当前案件的简单重复
- 最好的地点历史包含一个「先前事件」，该事件与当前案件有共同的超自然特征，但不相同——足够类似以确认模式，足够不同以防止简单类比
- 历史可以通过多种渠道进入叙事：档案、建筑记录、当地传说、目击者的「我小时候就知道这个地方有问题」

---

### 目击者陈述与物理证据的矛盾

这个矛盾是调查叙事的引擎。设计矛盾时：

- 目击者陈述和物理证据都应该是真实的，而不是其中一个是错误的
- 矛盾应该无法通过标准的「目击者记忆不可靠」解释来消解——矛盾太精确、太一致、或太不寻常，以至于简单的认知偏差无法解释
- 最好的矛盾具体锁定在一个特定的物理可能性上：「目击者说X，物理证据说Y；X和Y无法同时为真，但两者都有具体证据支撑」

---

### 关键调查问题的设计

关键调查问题定义了现场作为谜题的认识论结构——它揭示什么，它拒绝揭示什么。

好的调查问题具有以下特征：
- 可以被尝试回答（推进调查），但答案会产生新的问题
- 指向现场最根本的不可解性（如果回答了，整个谜题就解开了；所以它不会被轻易回答）
- 与调查者的专业能力相关——这是他们应该能够回答的问题，而现场使这个回答变得不可能

---

### 根据叙事目的设计现场

**开场现场**：建立规则。读者在这里学习这个世界的超自然遵循什么逻辑。开场现场的超自然异常应该足够有力以建立信任（这不是常规案件），又足够局限以留下未解的谜题。

**中期调查现场**：升级复杂性。中期现场揭示了模式（这不是孤立事件），增加了机构阻力（为什么这个现场被清理过），并引入了指向更大阴谋的证据。

**高潮现场**：汇聚所有线索。高潮现场是调查者直面超自然真相的地方，物理环境本身通常参与了这种对抗——结构不再安全，证据不再稳定，常规法证的工具变得不充分甚至有反效果。

---

### 常见错误

- 常规法证证据只是陈述「发现了血迹/指纹/DNA」，没有实际的法证分析内容（缺乏专业密度）
- 超自然异常只描述氛围（「现场令人毛骨悚然」），没有具体的物理不可能性
- 地点历史直接解释了当前事件（剥夺了调查过程的神秘感）
- 目击者陈述与物理证据完全吻合（没有张力）
- 关键调查问题过于宏观（「谁干的？」）而非指向具体的物理不可能性
- 超自然异常与现场的具体类型和历史无关（通用的超自然道具，不是这个现场独有的谜题）',
  '## "Crime Scene" Generation — Paranormal Forensics Novel

The crime scene is both the investigation''s entry point and the reader''s primary classroom for understanding this world''s rules. Weak scene design fails in one of two directions: either the conventional forensic evidence is too thin to establish professional credibility, or the paranormal anomalies are too vague to generate genuine cognitive dissonance. Both failures destroy the genre''s most essential effect — making the impossible feel specific, documented, and undeniable in the presence of professional methodology.

---

### Field Generation Guide

#### Location Name

The name should convey specific geographic and functional information. Not "abandoned factory" but "Former Linfield Brothers Chemical Plant, Production Building 3, Second Floor." Specific naming establishes reality and provides investigative hooks for researching the location''s history.

#### Setting Type

Nine types, each with distinct forensic and paranormal narrative properties. See the Setting Type Design section below.

#### Physical Environment

Physical environment is not background description — it is the technical documentation of investigative baseline conditions. It should address:
- **Layout**: The spatial structure — which areas are accessible, which are obstructed, movement pathways and sight lines
- **Condition**: The current state of the environment — light levels, temperature, odors, acoustic properties, structural integrity
- **Disturbance indicators**: What has been moved, damaged, cleaned, or deliberately preserved
- **Temporal factors**: The elapsed time between the event and the investigation, and how that interval has affected evidence condition

Physical environment details should connect directly to or tension against both the Conventional Forensic Evidence and Paranormal Anomalies fields.

#### Conventional Forensic Evidence

The field that requires the most technical precision in scene design. See the dedicated Forensic Evidence Design section below.

#### Paranormal Anomalies

The field that requires the most precise imagination. See the dedicated Paranormal Anomalies Design section below.

#### History of the Location

Records what happened at this location before the current case, and how it relates to the investigation. Design principle: history should add depth without providing answers. The most effective location history contains a prior event that shares paranormal characteristics with the current case but is not identical — enough similarity to establish pattern, enough difference to prevent simple analogy.

#### Witness Accounts

The narrative value of witness testimony is in its conflict with physical evidence, not its consistency with it. When designing witness accounts, identify the most productive contradiction this specific scene enables: what did witnesses describe, and what does the physical evidence indicate, and how is it impossible for both to be simultaneously true?

#### Key Investigative Questions

This field defines the scene''s epistemological function in the narrative — what it reveals to the investigator and what it refuses to reveal. Strong investigative questions are not "who did this?" but rather "how was this wound pattern physically produced?" or "why did every electronic device stop functioning at the same moment?" or "was the person recorded in the corridor actually the person whose credentials were used to enter the building?"

---

### Setting Type Design: What Makes Each Type Distinctive

#### 1. Residential (Home, Apartment)

The residential scene''s core narrative property is **the contrast between intimacy and violation**. A home is where human beings construct their sense of control and safety. A paranormal event here means nowhere is safe.

**Distinctive forensic characteristics**: Residences are layered with personal objects and the traces of daily life. Hair, fibers, fingerprints, personal effects — the forensic density is high and deeply personal. More importantly, the investigator can reconstruct the victim''s habits, relationships, and fears from the accumulated evidence of how they lived. The ordinary domestic object that doesn''t belong, the food prepared but not eaten, the bed made or unmade — these details tell the story of the final hours.

**Distinctive paranormal characteristics**: Residential anomalies tend to be territorial and habitual — one room consistently colder than adjacent rooms despite shared HVAC; an object repeatedly returned to a specific position it was never deliberately placed in; the resident''s behavioral patterns changing in documentable ways over a period of weeks before the event. The paranormal has been living with them.

**Design emphasis**: Who lived here, their relationship to this specific place, and how the anomalies integrated into daily life without being recognized as such.

#### 2. Medical Facility

The medical facility''s core narrative property is the **collision between documentation systems and paranormal events**. Hospitals maintain precise records with timestamps, physiological data, staff logs, and surveillance coverage — which means paranormal events here are simultaneously the most well-documented and the most officially deniable.

**Distinctive forensic characteristics**: Medical records, medication logs, continuous vital sign monitoring data, surveillance footage (often the densest coverage of any setting), and multi-tier staff testimony where the accounts of physicians, nurses, and technicians may diverge significantly. Medical equipment itself is evidence — device anomalies are technically traceable to specific timestamps and parameters.

**Distinctive paranormal characteristics**: Records showing physiologically impossible data (heart rate readings from equipment confirmed in calibration; medication concentrations inconsistent with administered doses); patient records showing activity following documented time of death; all monitoring systems experiencing simultaneous anomalous readings at a specific moment that correlates with nothing explainable.

**Design emphasis**: The specifics of the documentation system — what was recorded, what should have been recorded but is absent, and who had the access and authority to modify records.

#### 3. Industrial/Abandoned

The abandoned industrial site''s core narrative property is **isolation and historical accumulation**. No routine human presence means the scene can preserve evidence for extended periods — but also means no ongoing witnesses and no institutional oversight.

**Distinctive forensic characteristics**: Physical evidence can persist with minimal disturbance, but industrial chemicals, corrosion, and structural decay complicate analysis. The temporal layering challenge is distinctive: separating evidence of recent events from decades of historical residue requires extraordinary care, and the line is not always clear.

**Distinctive paranormal characteristics**: Industrial paranormal phenomena are frequently connected to the site''s history of operation — industrial accidents, labor disasters, environmental contamination events. The specific way the structure fails (sections that should have collapsed but stand intact; sections that collapsed without mechanical explanation) can itself be paranormal evidence.

**Design emphasis**: The facility''s operational history and the reason for its abandonment, and the potential historical connection to the current case.

#### 4. Public Space

The public space''s core narrative property is **the abundance of potential witnesses combined with the fundamental unreliability of crowd testimony**. Dozens or hundreds of people may have been present, but the chaos of public environments and people''s psychological mechanisms for denying anomalous experience produce testimony that is highly contradictory.

**Distinctive forensic characteristics**: Dense surveillance coverage (though with predictable blind spots), transaction records, phone location data, ticketing systems — digital evidence density is extremely high. Physical trace evidence is simultaneously abundant and contaminated by the passage of many people.

**Distinctive paranormal characteristics**: The collective experience — a large group simultaneously experiencing something inexplicable, with each account incompatible with the others. Or the inverse: surveillance footage recording something specific and unambiguous that no one present claims to have noticed.

**Design emphasis**: The specific state of the digital recording systems and how the anomaly maintained deniability in the presence of mass witnessing.

#### 5. Natural Environment

The natural environment''s core narrative property is **the exposure of forensic methodology''s limitations**. Standard forensic practice was developed for constructed environments — outdoors, many procedures apply imperfectly or not at all.

**Distinctive forensic characteristics**: Trace evidence (footprints, vegetation disturbance), environmental data (weather records, wildlife activity indicators), geological and soil samples. The temporal factor is acute: natural environments change evidence at predictable rates that can be precisely calculated.

**Distinctive paranormal characteristics**: Vegetation patterning inconsistent with seasonal or biological norms (particularly geometric patterns); wildlife behavioral anomalies (complete absence of species in their known range; local animals avoiding a specific area despite no apparent threat); soil chemistry indicating compounds with no possible natural or industrial source.

**Design emphasis**: The technical challenges of the investigation itself — no controlled environment, no surveillance, natural forces continuously modifying evidence state, and the physical demands of the terrain.

#### 6. Religious Site

The religious site''s core narrative property is **the overlapping of symbolic density with actual paranormal phenomena**. Religious buildings are designed to establish a connection with the supernatural. This means distinguishing deliberate religious symbolism from genuine paranormal evidence is a real forensic challenge.

**Distinctive forensic characteristics**: Religious institutions typically maintain meticulous historical records spanning decades or centuries. Physical structures frequently contain hidden spaces — crypts, sealed chambers, inner rooms. The layered physical residue of generations of worshippers provides an exceptionally complex material evidence background.

**Distinctive paranormal characteristics**: In a space "designed to connect with the supernatural," anomalies must manifest in ways that cannot be explained by religious texts, practices, or architecture. The distinction between "intended supernatural effect" and "unintended paranormal event" is itself an investigative question.

**Design emphasis**: The specific history of this religious community, and whether the current events form a disturbing parallel with specific historical events or texts within that tradition.

#### 7. Government/Institutional

The government facility''s core narrative property is **institutional evidence control**. Events here occur within a system that has built-in capacity to document, filter, and suppress its own evidence.

**Distinctive forensic characteristics**: Access logs, credential verification records, internal communications — the documentary trail is potentially detailed to the minute. But the capacity to erase these records exists within the same institution.

**Distinctive paranormal characteristics**: Institutional paranormal phenomena frequently center on what the institution is doing — particularly if that activity involves classified research, sensitive archives, or undisclosed programs. The anomaly may point toward the nature of the institutional activity rather than simply toward the paranormal.

**Design emphasis**: How institutional obstruction interacts with evidence-gathering, and specifically whether evidence degradation occurred before, during, or after the event — the timing of suppression is itself evidence.

#### 8. Vehicle or Transit

The vehicle or transit scene''s core narrative property is **the combination of mobility and enclosure**. The event occurred in a sealed space that can move — with significant forensic implications for the timeline and the identity of possible agents.

**Distinctive forensic characteristics**: Vehicle interiors are highly controlled micro-environments where trace evidence can be extremely precise. GPS data, drive logs, speed and braking records, interior cameras — technical recording density is high and timestamp-accurate.

**Distinctive paranormal characteristics**: A vehicle that stopped while in motion (with all systems simultaneously failing without mechanical explanation); passengers collectively experiencing something that no mechanical failure accounts for; a timeline accurate to the second that places impossible events in sequence. Or the vehicle as a transit of something that did not begin or end with the vehicle''s route.

**Design emphasis**: Mobility means the "scene" is transportable, and enclosure means every person aboard is both witness and potential subject.

---

### The Dual-Evidence Principle: The Most Critical Design Rule

**Every scene must carry both conventional forensic evidence and paranormal anomalies. Both must be specific and detailed. Neither can be generic or atmospheric.**

This principle exists because the genre''s central dramatic mechanism is the productive tension between two evidentiary systems — one pointing toward conventional explanation, one pointing toward impossible explanation — with both grounded in the same physical location and both documented to professional standard. If either system is weak, the entire structure fails.

---

### Designing Conventional Forensic Evidence

**Professional precision is mandatory.** Forensic evidence descriptions must reach the level of professional credibility, not procedural television shorthand.

Wrong: "Blood was found at the scene."

Right: "Arterial spatter on the north wall — the distribution pattern indicates the victim was upright and proximate to the wall surface at the moment of wound infliction. Cast-off on the ceiling beam above the secondary stain cluster suggests a second strike with a downward arc following the initial wound. The absence of transfer bloodstains on any floor surface between the body''s final position and the primary spatter origin cannot be reconciled with any ambulatory scenario; the victim did not walk there. Yet no mechanical transport mechanism is evidenced."

**What forensic evidence must contain**:
- **Specific physical description**: Not "evidence was found" but what, where, in what condition
- **Forensic analysis conclusion**: What professional examination of the evidence determined
- **The boundary where analysis fails**: This is the bridge to paranormal anomalies — not "nothing was found" but "this was found, and forensically it means X, and X is physically impossible"

**Core forensic evidence types and their narrative functions**:
- **Blood pattern analysis**: Spatter reconstruction establishes event sequence, force direction, timing — and can identify exactly what physical mechanics are impossible
- **Trace evidence** (hair, fiber, footprints): Establishes who was present — but in paranormal cases, the identity of "who" may require renegotiation
- **Toxicology**: Tissue fluid analysis reveals drugs, toxins, anomalous compounds — or compounds that should not be present in any biological context
- **Cause of death**: Autopsy findings including wound characteristics, time of death determination, manner of death — the point where pathology meets the impossible
- **Digital forensics**: Device records, communications, timestamps — when digital evidence is anomalous (timestamps in systems that cannot be modified; data that modified itself; recordings of events that the equipment should not have been able to capture), it serves as a particularly powerful bridge between the conventional and paranormal

---

### Designing Paranormal Anomalies

**Precisely defined impossibility** is the standard. Not "the scene felt wrong" but exactly how and why the physical evidence violates what forensic science says must be true.

Wrong: "The scene felt deeply unnatural and disturbing."

Right: "DNA analysis of blood samples returned three distinct sequence profiles, all consistent with the victim''s known genetic material — but mitochondrial DNA markers indicate cellular age variation spanning decades. The victim was 34 years old; certain tissue samples display senescence markers consistent with individuals over 70, while others display markers consistent with pre-adolescent development. The samples were collected from the same wound, in the same session, with chain of custody confirmed."

**Paranormal anomaly types and their narrative functions**:
- **Temporal anomalies** (time of death cannot be established; evidence sequences that violate causal order): Attacks the most fundamental forensic capability — timeline reconstruction
- **Spatial anomalies** (wounds from geometrically impossible angles; objects present in sealed spaces): Challenges the physical causation chain
- **Physiological anomalies** (impossible cause of death; physiological states without medical explanation): Challenges the explanatory framework of medicine and pathology
- **Data anomalies** (equipment recorded events that should not have been recordable; timestamps altered in systems confirmed as unmodified): Challenges digital evidence''s claimed objectivity
- **Witnessing anomalies** (multiple independent witnesses describing identical impossible events; or no witnesses, with evidence of extensive activity): Challenges testimony reliability at a structural level

**Anomalies must be specific, measurable, and in direct conflict with the forensic evidence** — not "disturbing" but "technically impossible, with the precise nature of the impossibility describable in professional terms."

---

### Using Location History

Location history adds depth without providing answers. Design principles:

- History must be relevant to the current case but must not be a simple repetition of it
- The most effective location history contains a prior event that shares paranormal characteristics with the current investigation but is not identical — similar enough to establish pattern, different enough to prevent simple analogy
- History can enter the narrative through multiple channels: archives, building records, local oral tradition, witnesses who say "I always knew something was wrong with this place" with specifics that turn out to be verified

---

### Designing Witness-Evidence Contradiction

This contradiction is the investigation''s engine. Design guidelines:

- Both the witness account and the physical evidence should be real — not one of them is simply wrong
- The contradiction should be irresolvable through standard "witness memory is unreliable" dismissal: it is too precise, too consistent across multiple independent witnesses, or too anomalous for cognitive bias to explain
- The most effective contradiction locks onto a specific physical possibility: "witnesses describe X; physical evidence indicates Y; X and Y cannot both be true, but both have specific evidentiary support"

---

### Key Investigative Questions

These questions define the scene''s epistemological structure. Effective questions have these characteristics:
- They can be approached (they advance the investigation) but answers generate new questions
- They point toward the scene''s fundamental inexplicability (answering them fully would resolve the case — so they will not be answered easily)
- They connect to the investigator''s professional competencies — these are questions they should be able to answer, and the scene has made that answer impossible

---

### Scene Design for Different Story Purposes

**Opening scene**: Establishes the rules. The reader learns here what logic the paranormal follows in this story. The anomalies should be powerful enough to establish that this is not a conventional case, and contained enough to leave the core mystery intact.

**Mid-investigation scene**: Escalates complexity. The mid-investigation scene reveals pattern (this is not isolated), introduces institutional interference (why has this scene been disturbed), and plants evidence pointing toward a larger structure. The paranormal rules established in the opening scene are applied here — and complicated.

**Climactic scene**: Converges all threads. The climactic scene is where the investigator confronts the paranormal truth directly, and the physical environment typically participates in that confrontation. The structure is no longer reliable. The evidence is no longer stable. Conventional forensic tools become insufficient or actively counterproductive.

---

### Common Mistakes

- Forensic evidence described only at the level of "blood/fingerprints/DNA were found" without actual forensic analysis content: the professional density is what makes the genre work
- Paranormal anomalies described only atmospherically ("the scene felt deeply unnatural"): anomalies must be specific physical impossibilities
- Location history that directly explains the current events: this removes the investigative mystery
- Witness accounts that align with physical evidence: no contradiction means no investigative tension
- Key investigative questions at the level of "who did it?" rather than pointing toward specific physical impossibilities
- Paranormal anomalies that are generic and disconnected from the specific setting type and location history: the impossibility should be particular to this place, this event, this case',
  (SELECT id FROM novel_creation_method WHERE name = 'Paranormal Forensics Novel' LIMIT 1),
  1,
  31,
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
