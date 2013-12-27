-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local GetSpellInfo = GetSpellInfo

ProbablyEngine.parser = {
  lastCast = '',
  items = {
    head     = "HeadSlot",
    helm     = "HeadSlot",
    neck     = "NeckSlot",
    shoulder = "ShoulderSlot",
    shirt    = "ShirtSlot",
    chest    = "ChestSlot",
    belt     = "WaistSlot",
    waist    = "WaistSlot",
    legs     = "LegsSlot",
    pants    = "LegsSlot",
    feet     = "FeetSlot",
    boots    = "FeetSlot",
    wrist    = "WristSlot",
    bracers  = "WristSlot",
    gloves   = "HandsSlot",
    hands    = "HandsSlot",
    finger1  = "Finger0Slot",
    finger2  = "Finger1Slot",
    trinket1 = "Trinket0Slot",
    trinket2 = "Trinket1Slot",
    back     = "BackSlot",
    cloak    = "BackSlot",
    mainhand = "MainHandSlot",
    offhand  = "SecondaryHandSlot",
    weapon   = "MainHandSlot",
    weapon1  = "MainHandSlot",
    weapon2  = "SecondaryHandSlot",
    ranged   = "RangedSlot"
  }
}

ProbablyEngine.turbo = {
  modifier = ProbablyEngine.config.read('turbo_modifier', 1.3)
}

ProbablyEngine.parser.can_cast =  function(spell, unit, stopCasting)

  local turbo = ProbablyEngine.config.read('pe_turbo', false)
  if turbo then
    -- Turbo Mode Engage
    local castEnds = select(6, UnitCastingInfo("player"))
    local channelEnds = select(6, UnitChannelInfo("player"))
    if castEnds or channelEnds then
      local endTime = castEnds or channelEnds
      local timeNow = GetTime()
      local canCancel = ((endTime / 1000) - timeNow) * 1000
      if canCancel < (ProbablyEngine.lag*ProbablyEngine.turbo.modifier) then
        SpellStopCasting()
      end
    end
  end

  if spell == nil then return false end
  if unit == nil then unit = "target" end
  if unit == "ground" then unit = nil end
  local spellIndex, spellBook = GetSpellBookIndex(spell)
  if not spellIndex then
    return false
  end
  local _, spellId = GetSpellBookItemInfo(spellIndex, spellBook)
  if not spellId then
    return false
  end

  local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(spellId)
  local isUsable, notEnoughMana = IsUsableSpell(name)

  -- Savage Roar is broken as fuuuuuck
  --if spellId ~= 127538 and spellId ~= 33876 then
  --  local isSpellKnown = IsSpellKnown(spellId)
  --  local isPlayerSpell = IsPlayerSpell(spellId)
  --  if not isSpellKnown and not isPlayerSpell then
  --    if not IsSpellKnown(spellId) then return false end
  --  end
  --end

  if not isUsable then return false end
  if notEnoughMana then return false end
  if unit then
    if not UnitExists(unit) then return false end
    if not UnitIsVisible(unit) then return false end
    if UnitIsDeadOrGhost(unit) then return false end
    if SpellHasRange(spell) == 1 then
      if IsSpellInRange(spell, unit) == 0 then return false end
      if IsHarmfulSpell(GetSpellInfo(spellId)) and not UnitCanAttack("player", unit) then return false end
    end
  end
  if UnitBuff("player", GetSpellInfo(80169)) then return false end -- Eat
  if UnitBuff("player", GetSpellInfo(87959)) then return false end -- Drink
  if UnitBuff("player", GetSpellInfo(11392)) then return false end -- Invis
  if UnitBuff("player", GetSpellInfo(3680)) then return false end  -- L. Invis

  if select(2, GetSpellCooldown(spell)) > 0 then return false end

  if stopCasting then
    SpellStopCasting()
    return true
  end

  if ProbablyEngine.module.player.casting == true and turbo == false then return false end
  -- handle Surging Mists manually :(
  if spellId == 116694 or spellId == 124682 or spellId == 123273 then return true end
  if UnitChannelInfo("player") == nil then return true else return false end
  return true
end

ProbablyEngine.parser.can_cast_queue =  function(spell)
  local isUsable, notEnoughMana = IsUsableSpell(spell)
  if not isUsable then return false end
  if notEnoughMana then return false end
  if select(2, GetSpellCooldown(spell)) ~= 0 then return false end
  return true
end


ProbablyEngine.parser.nested = function(evaluationTable, event, target)
  local eval
  for _, evaluation in pairs(evaluationTable) do
    local evaluationType, eval = type(evaluation), true
    if evaluationType == "function" then
      eval = evaluation()
    elseif evaluationType == "table" then
      eval = ProbablyEngine.parser.nested(evaluation, event, target) -- for the lulz
    elseif evaluationType == "string" then
      if string.sub(evaluation, 1, 1) == '@' then
        eval = ProbablyEngine.library.parse(event, evaluation, target)
      else
        eval = ProbablyEngine.dsl.parse(evaluation, event)
      end
    elseif evaluationType == "nil" then
      eval = false
    elseif evaluationType == "boolean" then
      eval = evaluation
    end
    if not eval then return false end
  end
  return true
end

ProbablyEngine.parser.table = function(spellTable, fallBackTarget)

  for _, arguments in pairs(spellTable) do

    ProbablyEngine.dsl.parsedTarget = nil

    local eventType = type(arguments[1])
    local event = arguments[1]
    local evaluationType = type(arguments[2])
    local evaluation = arguments[2]
    local target = arguments[3] or fallBackTarget
    local slotId = 0
    local itemName = ''
    local itemTexture = ''
    local itemId = 0
    local stopCasting = false

    if eventType == "string" then
      if string.sub(event, 1, 1) == '!' then
        if string.sub(event, 2, 2) == '/' then
          eventType = "macro"
        else
          if string.sub(event, 2, 2) == '#' then
            eventType = "item"
          end
          event = event:sub(2)
          stopCasting = true
        end
      elseif string.sub(event, 1, 1) == '#' then
        eventType = "item"
      end
    end

    -- is our eval a lib call ?
    if evaluationType == "string" then
      if string.sub(evaluation, 1, 1) == '@' then
        evaluationType = "library"
      end
    end

    -- healing?
    if target == "lowest" then
      target = ProbablyEngine.raid.lowestHP()
      if target == false then return end
    elseif target == "tank" then
      if UnitExists("focus") then
        target = "focus"
      else
        target = ProbablyEngine.raid.tank()
      end
    end

    if eventType == "string" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, event)
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, event, target)
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "library" then
        evaluation = ProbablyEngine.library.parse(event, evaluation, target)
      elseif evaluationType == "nil" then
        evaluation = true
      end
    elseif eventType == "table" or eventType == "macro" or eventType == "item" then
      if evaluationType == "string"  then
        evaluation = ProbablyEngine.dsl.parse(evaluation, '')
      elseif evaluationType == "table" then
        evaluation = ProbablyEngine.parser.nested(evaluation, '', target)
      elseif evaluationType == "function" then
        evaluation = evaluation()
      elseif evaluationType == "library" then
        evaluation = ProbablyEngine.library.parse(event, evaluation, target)
      elseif evaluationType == "nil" then
        evaluation = true
      end
    end

    if target == nil then
      target = ProbablyEngine.dsl.parsedTarget or "target"
    end

    if eventType == "item" then
      local slot = string.sub(event, 2)
      if ProbablyEngine.parser.items[slot] then
        slotId, itemTexture = GetInventorySlotInfo(ProbablyEngine.parser.items[slot])
        if slotId then
          local itemStart, itemDuration, itemEnable = GetInventoryItemCooldown("player", slotId)
          itemId = GetInventoryItemID("player", slotId)
          if itemStart > 0 then
            evaluation = false
          elseif not GetItemSpell(itemId) then
            evaluation = false
          end
        end
      else
        eventType = "bagItem"
        local item = slot
        if not tonumber(item) then
          item = GetItemID(item)
        end
        itemId = item
        if itemId then
          itemName, _, _, _, _, _, _, _, _, itemTexture, _ = GetItemInfo(itemId)
          local itemStart, itemDuration, itemEnable = GetItemCooldown(itemId)
          if itemStart > 0 then
            evaluation = false
          elseif GetItemCount(itemId) == 0 then
            evaluation = false
          end
        end
      end
    end

    if evaluation then
      if eventType == "table" then
        local tableNestSpell, tableNestTarget = ProbablyEngine.parser.table(event, target)
        if tableNestSpell ~= false then return tableNestSpell, tableNestTarget end
      elseif eventType == "macro" then
        RunMacroText(string.sub(event, 2))
        return false
      elseif eventType == "item" then
        if stopCasting then SpellStopCasting() end
        UseInventoryItem(slotId)
        ProbablyEngine.actionLog.insert('Use Inventory Item', itemName, itemTexture)
        return false
      elseif eventType == "bagItem" then
        if stopCasting then SpellStopCasting() end
        UseItemByName(itemName, target)
        ProbablyEngine.actionLog.insert('Use Bag Item', itemName, itemTexture)
        return false
      elseif event == "pause" then
        return false
      else
        if ProbablyEngine.parser.can_cast(event, target, stopCasting) then
          return event, target
        end
      end
    end

  end

  return false
end
