import type { DocsContentEntry } from "../../types";

import { zhCreation, enCreation } from "./creation";
import { zhNovelCreate, enNovelCreate } from "./novel-create";
import { zhCreationMethods, enCreationMethods } from "./creation-methods";
import { zhNovelSettings, enNovelSettings } from "./novel-settings";
import { zhChapterEdit, enChapterEdit } from "./chapter-edit";
import { zhModuleTree, enModuleTree } from "./module-tree";
import { zhModuleEdit, enModuleEdit } from "./module-edit";
import { zhAiAssistant, enAiAssistant } from "./ai-assistant";
import { zhAiMention, enAiMention } from "./ai-mention";
import { zhChatHistory, enChatHistory } from "./chat-history";
import { zhSmartWrite, enSmartWrite } from "./smart-write";
import { zhAiModes, enAiModes } from "./ai-modes";
import { zhEditorToolbar, enEditorToolbar } from "./editor-toolbar";
import { zhAiModels, enAiModels } from "./ai-models";
import { zhCharacters, enCharacters } from "./characters";
import { zhScenes, enScenes } from "./scenes";
import { zhProps, enProps } from "./props";
import { zhOrganizations, enOrganizations } from "./organizations";
import { zhDynamicInfo, enDynamicInfo } from "./dynamic-info";
import { zhRelationGraph, enRelationGraph } from "./relation-graph";
import { zhPlotManagement, enPlotManagement } from "./plot-management";
import { zhSkills, enSkills } from "./skills";
import { zhConfiguration, enConfiguration } from "./configuration";

export const zhUserGuideContent: Record<string, DocsContentEntry> = {
  creation: zhCreation,
  "novel-create": zhNovelCreate,
  "creation-methods": zhCreationMethods,
  "novel-settings": zhNovelSettings,
  "chapter-edit": zhChapterEdit,
  "module-tree": zhModuleTree,
  "module-edit": zhModuleEdit,
  "ai-assistant": zhAiAssistant,
  "ai-mention": zhAiMention,
  "chat-history": zhChatHistory,
  "smart-write": zhSmartWrite,
  "ai-modes": zhAiModes,
  "editor-toolbar": zhEditorToolbar,
  "ai-models": zhAiModels,
  characters: zhCharacters,
  scenes: zhScenes,
  props: zhProps,
  organizations: zhOrganizations,
  "dynamic-info": zhDynamicInfo,
  "relation-graph": zhRelationGraph,
  "plot-management": zhPlotManagement,
  skills: zhSkills,
  configuration: zhConfiguration,
};

export const enUserGuideContent: Record<string, DocsContentEntry> = {
  creation: enCreation,
  "novel-create": enNovelCreate,
  "creation-methods": enCreationMethods,
  "novel-settings": enNovelSettings,
  "chapter-edit": enChapterEdit,
  "module-tree": enModuleTree,
  "module-edit": enModuleEdit,
  "ai-assistant": enAiAssistant,
  "ai-mention": enAiMention,
  "chat-history": enChatHistory,
  "smart-write": enSmartWrite,
  "ai-modes": enAiModes,
  "editor-toolbar": enEditorToolbar,
  "ai-models": enAiModels,
  characters: enCharacters,
  scenes: enScenes,
  props: enProps,
  organizations: enOrganizations,
  "dynamic-info": enDynamicInfo,
  "relation-graph": enRelationGraph,
  "plot-management": enPlotManagement,
  skills: enSkills,
  configuration: enConfiguration,
};
