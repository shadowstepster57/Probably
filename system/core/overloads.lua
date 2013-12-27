-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local BOOKTYPE_PET = BOOKTYPE_PET
local GetNumSpellTabs = GetNumSpellTabs
local GetSpellBookItemName = GetSpellBookItemName
local GetSpellInfo = GetSpellInfo
local GetSpellLink = GetSpellLink
local GetSpellTabInfo = GetSpellTabInfo
local HasPetSpells = HasPetSpells
local stringLower = string.lower
local stringMatch = string.match

local spellCache = {}
local spellIndexCache = {}
local itemCache = {}

function GetSpellID(spell)
  if type(spell) == 'number' then return spell end

  local loweredSpell = stringLower(spell)
  local cache = spellCache[loweredSpell]
  if cache then return cache end

  local spellID = stringMatch(GetSpellLink(spell) or '', 'Hspell:(%d+)|h')
  if spellID then
    spellCache[loweredSpell] = tonumber(spellID)
    return tonumber(spellID)
  end

  return false
end

function GetSpellName(spell)
  local spellID = tonumber(spell)
  if spellID then
    return GetSpellInfo(spellID)
  end

  return spell
end

function GetSpellBookIndex(spell)
  local spellName = GetSpellName(spell)

  local cache = spellIndexCache[spellName:lower()]
  if cache then return cache[1], cache[2] end

  for t = 1, 2 do
    local _, _, offset, numSpells = GetSpellTabInfo(t)
    local i
    for i = 1, (offset + numSpells) do
      if GetSpellBookItemName(i, BOOKTYPE_SPELL) == spellName then
        spellIndexCache[spellName:lower()] = { i, BOOKTYPE_SPELL }
        return i, BOOKTYPE_SPELL
      end
    end
  end

  local numFlyouts = GetNumFlyouts()
  for f = 1, numFlyouts do
    local flyoutID = GetFlyoutID(f)
    local name, description, numSlots, isKnown = GetFlyoutInfo(flyoutID)
    if isKnown then
      for g = 1, numSlots do
        local spellID, isKnownSpell = GetFlyoutSlotInfo(flyoutID, g)
        if isKnownSpell and GetSpellName(spellID) == spellName then
          spellIndexCache[spellName:lower()] = { spellID, nil }
          return spellID, nil
        end
      end
    end
  end

  local numPetSpells = HasPetSpells()
  if numPetSpells then
    for i = 1, numPetSpells do
      if GetSpellBookItemName(i, BOOKTYPE_PET) == spellName then
        spellIndexCache[spellName:lower()] = { i, BOOKTYPE_SPELL }
        return i, BOOKTYPE_PET
      end
    end
  end

  return false
end

function GetItemID(item)
  if type(item) == 'number' then return item end

  local loweredItem = stringLower(item)
  local cache = itemCache[loweredItem]
  if cache then return cache end

  local itemID = stringMatch(select(2, GetItemInfo(item)) or '', 'Hitem:(%d+):')
  if itemID then
    itemCache[loweredItem] = tonumber(itemID)
    return tonumber(itemID)
  end

  return false
end

function UnitID(target)
  return tonumber(UnitGUID(target):sub(6, 10), 16)
end
UnitId = UnitID

function table.length(tbl)
  local count = 0
  for _ in pairs(tbl) do
    count = count + 1
  end
  return count
end
