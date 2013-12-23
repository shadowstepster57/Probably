-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local BOOKTYPE_PET = BOOKTYPE_PET
local GetNumSpellTabs = GetNumSpellTabs
local GetSpellBookItemName = GetSpellBookItemName
local GetSpellTabInfo = GetSpellTabInfo
local HasPetSpells = HasPetSpells

-- lets write to the global, how dirty...

-- since this doesn't exist, make it!
GetSpellID = function(spell)
  if type(spell) == "number" then return spell end
  local match = string.match(GetSpellLink(spell) or '', 'Hspell:(%d+)|h')
  if match then return tonumber(match) else return false end
end

-- this is also useful
GetSpellName = function(spell)
  if tonumber(spell) then
    local spellID = tonumber(spell)
    return GetSpellInfo(spellID)
  end
  return spell
end

GetSpellBookIndex = function (spell)
  local spellID = tonumber(spell)
  if spellID then
    spell = GetSpellName(spellID)
  end

  for t = 1, 2 do
    local _, _, offset, numSpells = GetSpellTabInfo(t)
    local i
    for i = 1, (offset + numSpells) do
      if GetSpellBookItemName(i, BOOKTYPE_SPELL) == spell then return i, BOOKTYPE_SPELL end
    end
  end

  local numPetSpells = HasPetSpells()
  if numPetSpells then
    for i = 1, numPetSpells do
      if GetSpellBookItemName(i, BOOKTYPE_PET) == spell then return i, BOOKTYPE_PET end
    end
  end

  return nil
end

GetItemID = function(item)
  if type(item) == "number" then return item end
  local match = string.match(select(2, GetItemInfo(item)) or '', 'Hitem:(%d+):')
  if match then return tonumber(match) else return false end
end

UnitId = function(target)
  return tonumber(UnitGUID(target):sub(6,10), 16)
end

UnitID = UnitId

table.length = function(table)
  local count = 0
  for _,_ in pairs(table) do
    count = count + 1
  end
  return count
end
