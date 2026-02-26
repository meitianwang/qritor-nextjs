-- 凶宅灵异租房小说命名技能（Layer 3）
-- Usage: mysql -u root -p784784 qritor_dev < prisma/seeds/skill-xiongzhai-novel-naming.sql

INSERT INTO skill (name, description, description_en, instructions, instructions_en, novel_creation_method_id, is_active, sort_order, created_at)
VALUES (
  'xiongzhai-novel-naming',
  '小说命名：为凶宅灵异租房小说生成书名和内容简介，符合都市灵异凶宅题材的命名美学',
  'Novel naming: generate book titles and synopses for haunted rental horror novels, consistent with the urban supernatural haunted-apartment aesthetic',
  '## 小说命名 — 凶宅灵异租房小说创作

凶宅灵异租房类小说的书名和简介有一套独特的命名美学：**日常与异常的交叉**。书名不需要直接说恐怖，但要让读者一眼就感受到"这个普通的日常背后有问题"。

---

## 一、书名命名哲学

凶宅流书名有三种基本美学路线：

### 路线一：地址/空间直指型

用具体的空间地址或房间编号命名，在日常感中暗藏不安：

**特点**：高度日常化，看似普通，但配合"凶宅"的内容预期，立刻有恐惧感

**书名格式**：
```
XX小区XX栋XX室
XX号公寓
□□路□□号
X楼X门背后
```

**示例**：
- 《万象城19楼01室》——高档小区+具体门牌，读者脑中立刻建构那间房的样子
- 《天朗雅苑的最后一间》——"最后一间"暗示这间房与其他间不同
- 《301》——极简的房间号，什么都没说，但什么都暗示了

**使用场景**：适合空间感强的故事，读者代入感强；适合推理-恐惧并重的叙事

### 路线二：诡异现象直描型

直接描述故事中的核心恐怖现象：

**特点**：直给，恐惧感前置，让读者在点开之前就知道这是什么类型

**书名格式**：
```
[具体诡异细节]
[时间点]+[异常]
[主角的处境描述]
```

**示例**：
- 《床底的呼吸声》——凶宅流最经典的单一恐惧元素
- 《镜子里的人不是我》——浴室镜子+微小差异，高度经典
- 《每晚三点的电视》——时间点+诡异行为，暗示规律性
- 《我住进去的第七天》——倒计时感，暗示第七天有什么

**使用场景**：适合网文快节奏风格；恐惧元素强的故事

### 路线三：调查/真相导向型

暗示故事的核心悬疑——为什么这间房有这样的历史：

**特点**：推理成分更重，书名已经暗示读者"这是一个需要被调查的谜"

**书名格式**：
```
[前任租客的名字或痕迹]
[关于这间房的疑问]
[主角的身份+凶宅的联结]
```

**示例**：
- 《前任租客留下的日记》——调查线起点，读者想知道日记里写了什么
- 《他们为什么都不住满一个月》——数字暗示规律性，问句驱动好奇
- 《这间房的第十三个住客》——数字，主角是第十三个，前面十二个去了哪里？

**使用场景**：适合真相揭露主导型故事；调查推理爱好者

---

## 二、主题词库

| 类别 | 词汇 |
|------|------|
| **空间** | 客厅、卧室、浴室、床底、衣柜、镜子、走廊、储物间、阳台、门、窗 |
| **时间** | 子时、三点、入住第X天、周五、第X个夜晚 |
| **诡异现象** | 呼吸声、手印、回响、脚步声、体温、水雾、电视、钥匙 |
| **调查** | 前租客、失踪、日记、遗留、档案、不归、残留 |
| **感知** | 看见、听见、感觉、背后、视线、不像、延迟 |

---

## 三、书名对比

| 弱书名（避免） | 强书名 | 弱化原因 |
|------------|------|---------|
| 《我租了一间闹鬼的房子》 | 《万象城19楼01室》 | 太直白，无暗示空间 |
| 《凶宅恐惧》 | 《床底的呼吸声》 | 概念性而非感官性 |
| 《灵异房屋探秘》 | 《前租客留下的日记》 | "探秘"缺乏代入感 |
| 《不可思议的出租屋》 | 《每晚三点的电视》 | "不可思议"太宽泛 |

---

## 四、内容简介撰写结构

凶宅流简介的黄金结构：**三段式**

**第一段（建立处境）**：
- 主角的现实困境（为什么需要租房）+ 这间房的第一眼吸引力（价格/地段）
- 隐含"这个人只是想找个便宜的地方住"的平凡感
- 末尾植入第一个"但是"（租金反差、或第一个可疑细节）

**第二段（建立恐惧）**：
- 恐惧开始：3-4个具体的诡异现象，要有感官具体性
- 调查开始：主角开始挖掘这间房的历史
- 上升到"主角意识到前任租客的遭遇"

**第三段（提出悬念/核心卖点）**：
- 这间房真正的秘密是什么（不揭示，但暗示规模）
- 主角的核心处境（想跑跑不了 / 真相让他无法离开）
- 以一个开放性的问题或场景收尾

**简介写作禁忌**：
- 不要在简介里剧透核心秘密
- 不要把恐惧现象描写成列表——用连贯叙述代替点列
- 不要用"前所未有的恐怖"等形容——用具体细节代替形容词评价

**示例结构（《万象城19楼01室》）**：

> 林晓在失业后的第三个月，在房屋中介的推荐下，看上了万象城19楼01室——两室一厅，精装修，配齐家电，月租只要市场价的三分之一。中介说，"只是死过人，但那都是两年前的事了，死者为大，你想开点就好。"
>
> 林晓想开了。
>
> 入住第一晚，她发现浴室镜子上有一个手印，形状很奇怪——手指太细，不像成年人的。第四天，电视在半夜自动开启，无声地播放着什么，画面上是这间房的客厅，只是不是现在，是很多年前——那个坐在沙发上的人是谁？第七天，她终于低下头看了床底。
>
> 她租下这间房之前，已经有十一个人住过这里。十一个人，在十一个不同的时间，以十一种不同的理由搬走，或者失联。她是第十二个。而住到第十三天，她在衣柜最深处找到了前任租客留下的最后一页日记。那一页日记只写了一句话，日期是三年前的今天。

---

## 五、常见错误

1. **书名太长**：凶宅流最有效的书名通常在6-10个字以内，太长失去冲击力
2. **简介没有感官细节**：全是概念性描述（"极度恐惧"、"超自然事件"）——要用具体的、可感知的细节
3. **简介揭示太多**：读者看完简介已经知道了核心秘密，没有阅读驱动力
4. **书名与内容脱节**：书名叫《浴室镜子》但故事的核心恐惧是床底——书名要对应故事最有力的恐惧元素',
  'Novel naming for haunted rental horror. Three aesthetic approaches: address/space direct (apartment number + complex name, creates immediate spatial imagination), bizarre phenomenon direct (specific horror element as title — "Breathing Under the Bed", "The TV at 3am"), investigation/truth oriented (previous tenant artifacts, numbered victims pattern). Title vocabulary: space words (bathroom, mirror, corridor), time words (3am, Day 7), horror phenomenon words (breathing, handprint, echo), investigation words (previous tenant, diary, missing). Three-paragraph synopsis structure: paragraph 1 (protagonist''s circumstances + apartment''s appeal + the first "but"), paragraph 2 (escalating horror phenomena + investigation begins), paragraph 3 (scale of the secret implied + protagonist''s trapped state + open-ended question). Avoid: spoiling the core secret, listing horror phenomena instead of narrating, using generic horror adjectives instead of specific sensory details.',
  (SELECT id FROM novel_creation_method WHERE name = '凶宅灵异租房' LIMIT 1),
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
