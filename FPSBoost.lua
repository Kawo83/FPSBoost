local ADDON_PREFIX = "|cff00c2ffFPSBoost:|r "

local function printMsg(message)
  DEFAULT_CHAT_FRAME:AddMessage(ADDON_PREFIX .. message)
end

local function isQuestEntryInfo(info)
  return info and info.questID and info.questID > 0 and not info.isHeader
end

local function unwatchQuestID(questID)
  if not C_QuestLog.RemoveQuestWatch then
    return false
  end

  local isWatched = nil
  if C_QuestLog.IsQuestWatched then
    isWatched = C_QuestLog.IsQuestWatched(questID)
  elseif C_QuestLog.GetQuestWatchType then
    isWatched = C_QuestLog.GetQuestWatchType(questID) ~= nil
  end

  if isWatched == false then
    return false
  end

  local ok = C_QuestLog.RemoveQuestWatch(questID)
  return ok ~= false
end

local function clearSuperTracked()
  if C_SuperTrack and C_SuperTrack.SetSuperTrackedQuestID then
    C_SuperTrack.SetSuperTrackedQuestID(0)
  end
end

local function unwatchQuests(filterHiddenOnly)
  local total = 0
  local removed = 0
  local hiddenCount = 0

  local numEntries = C_QuestLog.GetNumQuestLogEntries()
  for index = 1, numEntries do
    local info = C_QuestLog.GetInfo(index)
    if isQuestEntryInfo(info) then
      total = total + 1
      if info.isHidden then
        hiddenCount = hiddenCount + 1
      end
      if (not filterHiddenOnly) or info.isHidden then
        if unwatchQuestID(info.questID) then
          removed = removed + 1
        end
      end
    end
  end

  clearSuperTracked()

  if filterHiddenOnly then
    printMsg(("Hidden quests: %d, unwatched: %d."):format(hiddenCount, removed))
  else
    printMsg(("Quest entries: %d, unwatched: %d (hidden: %d)."):format(total, removed, hiddenCount))
  end
end

SLASH_FPSBOOST1 = "/fpsboost"
SlashCmdList.FPSBOOST = function(msg)
  local option = string.lower((msg or ""):gsub("^%s*(.-)%s*$", "%1"))

  if option == "hidden" then
    unwatchQuests(true)
    return
  end

  if option == "all" or option == "" then
    unwatchQuests(false)
    return
  end

  printMsg("Usage: /fpsboost [all|hidden]")
end

printMsg("Loaded. Use /fpsboost or /fpsboost hidden.")
