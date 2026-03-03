-- Paranormal Forensics Novel creation method initialization
-- Includes: creation method + 9 module types
-- Usage: mysql -u <user> -p <database> < init_forensic_paranormal.sql

-- 1. Create creation method
INSERT INTO novel_creation_method (name_zh, name_en, description_zh, novel_type_zh, novel_type_en, language, visible_categories, created_at)
VALUES (
  '法医灵异小说',
  'Paranormal Forensics Novel',
  'A forensic investigator confronts cases where evidence points beyond the mundane. Detectives, pathologists, and criminal profilers apply rigorous professional methods to supernatural phenomena — autopsies reveal ghostly trauma signatures, criminal profiles map the psychology of entities, and forensic analysis bridges the gap between the living and the dead.',
  '灵异',
  'Supernatural',
  'en',
  '["setting","character","scene","prop"]',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  novel_type_zh = VALUES(novel_type_zh),
  visible_categories = VALUES(visible_categories),
  updated_at = NOW();

-- Get method ID
SET @method_id = (SELECT id FROM novel_creation_method WHERE name_zh = '法医灵异小说' LIMIT 1);

-- 2. Create module types

-- 2.1 Case File
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '死亡剧本',
  'Death Script',
  'The active supernatural investigation case — official vs. true explanation, forensic anomalies, and investigation status',
  '{"type":"object","x-titleField":"Case Name","properties":{"Case Name":{"type":"string","title":"Case Name","useForAI":true},"Case Type":{"type":"string","title":"Case Type","enum":["Unexplained Homicide","Disappearance","Haunting","Mass Panic Event","Cursed Object Incident","Possession","Entity Manifestation","Other"],"x-uiWidget":"select","useForAI":true},"Case Type Details":{"type":"string","title":"Case Type Details","format":"textarea","useForAI":true},"Official Explanation":{"type":"string","title":"Official Explanation","description":"What mundane authorities believe happened","format":"textarea","useForAI":true},"True Supernatural Nature":{"type":"string","title":"True Supernatural Nature","description":"The actual paranormal cause or entity involved","format":"textarea","useForAI":true},"Victim Profile":{"type":"string","title":"Victim Profile","description":"Who was affected, their connection to the paranormal","format":"textarea","useForAI":true},"Forensic Anomalies":{"type":"string","title":"Forensic Anomalies","description":"Physical evidence that cannot be explained by conventional science","format":"textarea","x-rows":6,"useForAI":true},"Investigation Timeline":{"type":"string","title":"Investigation Timeline","description":"Key timeline events and urgency factors","format":"textarea","useForAI":true},"Current Status":{"type":"string","title":"Current Status","enum":["Active Investigation","Cold Case Reopened","Officially Closed (Cover-up)","Escalating Emergency","Multi-jurisdiction"],"x-uiWidget":"select","useForAI":true}},"required":["Case Name","Case Type","True Supernatural Nature"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.2 Investigator Profile
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '法医人设',
  'Forensic Persona',
  'The protagonist — professional background, paranormal sensitivity, investigative method, and core motivation',
  '{"type":"object","x-titleField":"Name","properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Profession":{"type":"string","title":"Profession","enum":["Forensic Pathologist","Homicide Detective","FBI Special Agent","Criminal Profiler","Private Investigator","Forensic Psychologist","Medical Examiner","Other"],"x-uiWidget":"select","useForAI":true},"Professional Specialization":{"type":"string","title":"Professional Specialization","description":"Core forensic skill set (e.g., blood spatter analysis, toxicology, behavioral profiling)","format":"textarea","useForAI":true},"Paranormal Sensitivity":{"type":"string","title":"Paranormal Sensitivity","enum":["Natural Sensitive (always perceived it)","Reluctant Believer (forced by evidence)","Clinical Detachment (treats it as data)","Trained Specialist (institutional training)","Inherited Ability","No Sensitivity (purely rational)"],"x-uiWidget":"select","useForAI":true},"Professional Credibility":{"type":"string","title":"Professional Credibility","enum":["Respected Authority","Rising Expert","Maverick Outsider","Disgraced Specialist (seeking redemption)","Deep Cover Agent"],"x-uiWidget":"select","useForAI":true},"Core Investigative Method":{"type":"string","title":"Core Investigative Method","enum":["Evidence-First (facts before theory)","Behavioral Profiling (entity psychology)","Forensic Science (lab and autopsy)","Intuition-Led (sensing before evidence)","Hybrid Methodology"],"x-uiWidget":"select","useForAI":true},"Personal Backstory":{"type":"string","title":"Personal Backstory","format":"textarea","useForAI":true},"Core Motivation":{"type":"string","title":"Core Motivation","enum":["Find Truth No Matter the Cost","Protect the Public from Paranormal Harm","Personal Loss Linked to the Supernatural","Advance Scientific Understanding","Institutional Duty","Other"],"x-uiWidget":"select","useForAI":true},"Core Motivation Details":{"type":"string","title":"Core Motivation Details","format":"textarea","useForAI":true}},"required":["Name","Profession","Paranormal Sensitivity","Core Investigative Method"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.3 Supernatural Framework
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '解剖规则',
  'Autopsy Rules',
  'The rules governing how the paranormal works in this story — forensic signatures, detection methods, interaction rules, weaknesses',
  '{"type":"object","x-titleField":"Entity Type","properties":{"Entity Type":{"type":"string","title":"Entity Type","enum":["Residual Ghost","Intelligent Haunting","Demonic Entity","Ancient Spirit","Cursed Object Manifestation","Mass Consciousness","Interdimensional Being","Unknown/Unclassified"],"x-uiWidget":"select","useForAI":true},"Detection Method":{"type":"string","title":"Detection Method","description":"How the investigator detects or verifies paranormal presence (EMF readings, autopsy markers, behavioral indicators, psychic impression)","format":"textarea","useForAI":true},"Forensic Signatures":{"type":"string","title":"Forensic Signatures","description":"Specific physical evidence left by the supernatural — the tells in autopsies, crime scenes, and lab results that distinguish paranormal from mundane","format":"textarea","x-rows":6,"useForAI":true},"Interaction Rules":{"type":"string","title":"Interaction Rules","description":"Can entities be communicated with? Negotiated with? Only witnessed?","format":"textarea","useForAI":true},"Threat Mechanism":{"type":"string","title":"Threat Mechanism","description":"How the entity causes harm — physical violence, psychological manipulation, possession, environmental hazard","format":"textarea","useForAI":true},"Weaknesses":{"type":"string","title":"Weaknesses","description":"What limits, repels, or neutralizes the entity","format":"textarea","useForAI":true},"Containment or Resolution":{"type":"string","title":"Containment or Resolution","description":"How cases involving this entity type are typically closed","format":"textarea","useForAI":true},"Scientific Plausibility Layer":{"type":"string","title":"Scientific Plausibility Layer","description":"How scientific or pseudoscientific the explanation is kept — hard science fiction framing vs. full supernatural acceptance","format":"textarea","useForAI":true}},"required":["Entity Type","Forensic Signatures","Detection Method"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.4 Investigation Organization
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '死者之城',
  'City of the Dead',
  'The institutional setting — clearance level, official cover, cover-up mechanisms, internal politics',
  '{"type":"object","x-titleField":"Organization Name","properties":{"Organization Name":{"type":"string","title":"Organization Name","useForAI":true},"Organization Type":{"type":"string","title":"Organization Type","enum":["Regular Police Department","Secret Government Unit","Federal Agency (Special Division)","Private Investigation Firm","Academic Research Group","Occult Society with Institutional Cover","Freelance Specialist","Other"],"x-uiWidget":"select","useForAI":true},"Official Cover":{"type":"string","title":"Official Cover","description":"What the organization officially claims to do (vs. its true paranormal mandate)","format":"textarea","useForAI":true},"Clearance Level":{"type":"string","title":"Clearance Level","enum":["Open (publicly known)","Classified (internal only)","Black Budget (off the books)","Deniable (officially does not exist)"],"x-uiWidget":"select","useForAI":true},"Case Classification System":{"type":"string","title":"Case Classification System","description":"How paranormal cases are categorized, filed, and kept separate from normal investigations","format":"textarea","useForAI":true},"Cover-up Mechanism":{"type":"string","title":"Cover-up Mechanism","description":"How the organization keeps paranormal cases from public knowledge","format":"textarea","useForAI":true},"Internal Politics":{"type":"string","title":"Internal Politics","description":"Power dynamics, skeptics vs. believers, institutional obstruction","format":"textarea","useForAI":true},"Resources and Limitations":{"type":"string","title":"Resources and Limitations","description":"What tools, budget, and authority the investigator has access to","format":"textarea","useForAI":true}},"required":["Organization Name","Organization Type","Clearance Level"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.5 Story Hook
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '悬念引擎',
  'Story Hook',
  'Core narrative tension — central mystery, opening hook, institutional pressure, emotional stakes, larger conspiracy',
  '{"type":"object","x-titleField":"Central Mystery","properties":{"Central Mystery":{"type":"string","title":"Central Mystery","description":"The core question driving the narrative — what happened, and why does it matter beyond this case?","format":"textarea","useForAI":true},"Opening Hook":{"type":"string","title":"Opening Hook","description":"The scene or discovery that pulls the reader in immediately","format":"textarea","useForAI":true},"Institutional Tension":{"type":"string","title":"Institutional Tension","description":"The cover-up, denial, or suppression pressure the investigator faces from within their own system","format":"textarea","useForAI":true},"Emotional Stakes":{"type":"string","title":"Emotional Stakes","description":"What does the investigator personally risk — professionally, emotionally, psychologically?","format":"textarea","useForAI":true},"Genre Subversion Element":{"type":"string","title":"Genre Subversion Element","description":"What makes this different from a standard procedural — the twist on forensic convention that the paranormal introduces","format":"textarea","useForAI":true},"Larger Conspiracy":{"type":"string","title":"Larger Conspiracy","description":"Is this case connected to something bigger — a pattern, a cover-up, a supernatural agenda?","format":"textarea","useForAI":true}},"required":["Central Mystery"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.6 Writing Style
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '冷峻叙事',
  'Writing Style',
  'Narrative approach — POV, tone balance between procedural and supernatural, technical detail level, pacing',
  '{"type":"object","x-titleField":"Narrative POV","properties":{"Narrative POV":{"type":"string","title":"Narrative POV","enum":["First Person (investigator voice)","Third Person Limited","Third Person Omniscient","Alternating POV"],"x-uiWidget":"radio","useForAI":true},"Tone Balance":{"type":"string","title":"Tone Balance","enum":["Clinical/Procedural (forensics-first, horror secondary)","Equal Balance (procedural and supernatural equally weighted)","Supernatural-Forward (forensics grounds the horror)","Dark Comedy (irony and black humor)"],"x-uiWidget":"select","useForAI":true},"Technical Detail Level":{"type":"string","title":"Technical Detail Level","enum":["Hard Forensics (forensically accurate, educational)","Soft Forensics (accurate enough, reader-friendly)","Impressionistic (technical atmosphere, not accuracy)"],"x-uiWidget":"select","useForAI":true},"Pacing Style":{"type":"string","title":"Pacing Style","enum":["Police Procedural Pace (methodical, evidence-driven)","Thriller Pace (fast cuts, rising tension)","Gothic Slow Burn (atmosphere builds over time)","Case-of-the-Week (episodic, standalone cases)"],"x-uiWidget":"select","useForAI":true},"Language Register":{"type":"string","title":"Language Register","description":"Professional jargon level, formality, any dialect or regional voice","format":"textarea","useForAI":true},"Reference Works":{"type":"string","title":"Reference Works","description":"Comparable novels, TV shows, or films that capture the intended tone","useForAI":true}},"required":["Narrative POV","Tone Balance"]}',
  @method_id,
  1,
  1,
  'setting',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.7 Character
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '角色',
  'Character',
  'Supporting cast — colleagues, suspects, victims, entities, and institutional obstacles',
  '{"type":"object","x-titleField":"Name","properties":{"Name":{"type":"string","title":"Name","useForAI":true},"Role":{"type":"string","title":"Role","enum":["Colleague/Partner","Suspect","Victim (deceased)","Victim (survivor)","Institutional Obstruction","Paranormal Informant","Entity/Ghost","Mentor","Antagonist"],"x-uiWidget":"select","useForAI":true},"Gender":{"type":"string","title":"Gender","enum":["Male","Female","Non-binary/Other"],"x-uiWidget":"radio","useForAI":true},"Professional Background":{"type":"string","title":"Professional Background","useForAI":true},"Relationship to the Paranormal":{"type":"string","title":"Relationship to the Paranormal","enum":["Aware and accepts it","Aware but denies it","Unwitting participant","Deliberate agent of the supernatural","Target/Victim","No knowledge"],"x-uiWidget":"select","useForAI":true},"Connection to the Case":{"type":"string","title":"Connection to the Case","format":"textarea","useForAI":true},"Personality":{"type":"string","title":"Personality","format":"textarea","useForAI":true},"Physical Description":{"type":"string","title":"Physical Description","format":"textarea","useForAI":true},"Hidden Agenda or Secret":{"type":"string","title":"Hidden Agenda or Secret","format":"textarea","useForAI":true},"Status":{"type":"string","title":"Status","enum":["Alive","Deceased","Missing","Compromised (possessed/influenced)","Unknown"],"x-uiWidget":"select","useForAI":true}},"required":["Name","Role","Relationship to the Paranormal"]}',
  @method_id,
  1,
  0,
  'character',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.8 Crime Scene
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '解剖场景',
  'Autopsy Scene',
  'Investigation locations — physical environment, conventional forensics, paranormal anomalies, witness conflicts',
  '{"type":"object","x-titleField":"Location Name","properties":{"Location Name":{"type":"string","title":"Location Name","useForAI":true},"Setting Type":{"type":"string","title":"Setting Type","enum":["Residential (home, apartment)","Medical Facility","Industrial/Abandoned","Public Space","Natural Environment","Religious Site","Government/Institutional","Vehicle or Transit","Other"],"x-uiWidget":"select","useForAI":true},"Physical Environment":{"type":"string","title":"Physical Environment","description":"Layout, condition, atmosphere, time of day and weather","format":"textarea","x-rows":5,"useForAI":true},"Conventional Forensic Evidence":{"type":"string","title":"Conventional Forensic Evidence","description":"What normal forensic analysis finds (trace evidence, blood patterns, cause of death indicators)","format":"textarea","x-rows":5,"useForAI":true},"Paranormal Anomalies":{"type":"string","title":"Paranormal Anomalies","description":"Evidence that defies conventional explanation (impossible wounds, temperature anomalies, spectral residue, timeline impossibilities)","format":"textarea","x-rows":5,"useForAI":true},"History of the Location":{"type":"string","title":"History of the Location","description":"Relevant prior events or supernatural history of this place","format":"textarea","useForAI":true},"Witness Accounts":{"type":"string","title":"Witness Accounts","description":"What witnesses reported — and how it conflicts with physical evidence","format":"textarea","useForAI":true},"Key Investigative Questions":{"type":"string","title":"Key Investigative Questions","description":"What this scene tells the investigator — and what it refuses to reveal","format":"textarea","useForAI":true}},"required":["Location Name","Setting Type"]}',
  @method_id,
  1,
  0,
  'scene',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();

-- 2.9 Evidence & Artifact
INSERT INTO module_type (name_zh, name_en, description_zh, json_schema_zh, novel_creation_method_id, enable_ai, singleton, entity_category, created_at)
VALUES (
  '法医道具',
  'Forensic Tool',
  'Physical and paranormal items — forensic significance, supernatural significance, chain of custody, danger level',
  '{"type":"object","x-titleField":"Item Name","properties":{"Item Name":{"type":"string","title":"Item Name","useForAI":true},"Item Type":{"type":"string","title":"Item Type","enum":["Physical Evidence (forensic)","Paranormal Artifact (supernatural object)","Personal Effect (victim/suspect)","Document or Record","Digital Evidence","Biological Sample","Unknown Object"],"x-uiWidget":"select","useForAI":true},"Forensic Significance":{"type":"string","title":"Forensic Significance","description":"What conventional forensic analysis reveals about this item","format":"textarea","useForAI":true},"Paranormal Significance":{"type":"string","title":"Paranormal Significance","description":"The supernatural role, history, or power of this item","format":"textarea","useForAI":true},"Current Location":{"type":"string","title":"Current Location","enum":["Evidence locker","Lab analysis","Field (not yet recovered)","Missing/Stolen","Destroyed","Classified storage"],"x-uiWidget":"select","useForAI":true},"Chain of Custody Issues":{"type":"string","title":"Chain of Custody Issues","description":"Any tampering, gaps, or irregularities in how this evidence was handled","format":"textarea","useForAI":true},"Danger Level":{"type":"string","title":"Danger Level","enum":["Safe to handle","Psychologically hazardous","Physically dangerous","Lethally dangerous","Unknown risk"],"x-uiWidget":"select","useForAI":true}},"required":["Item Name","Item Type"]}',
  @method_id,
  1,
  0,
  'prop',
  NOW()
)
ON DUPLICATE KEY UPDATE
  description_zh = VALUES(description_zh),
  json_schema_zh = VALUES(json_schema_zh),
  updated_at = NOW();
