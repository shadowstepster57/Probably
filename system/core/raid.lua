-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.raid = {
  roster = {}
}

local GetNumGroupMembers = GetNumGroupMembers
local IsInRaid = IsInRaid
local UnitCanAssist = UnitCanAssist
local UnitExists = UnitExists
local UnitGetIncomingHeals = UnitGetIncomingHeals
local UnitGetTotalHealAbsorbs = UnitGetTotalHealAbsorbs
local UnitGroupRolesAssigned = UnitGroupRolesAssigned
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitInParty = UnitInParty
local UnitInRange = UnitInRange
local UnitIsConnected = UnitIsConnected
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsFriend = UnitIsFriend
local UnitUsingVehicle = UnitUsingVehicle

local function canHeal(unit)
  if UnitExists(unit)
     and UnitCanAssist('player', unit)
     and UnitIsFriend('player', unit)
     and UnitIsConnected(unit)
     and not UnitIsDeadOrGhost(unit)
     and not UnitUsingVehicle(unit) then

     if UnitInParty(unit) and not UnitInRange(unit) then
       return false
     end

     return true
  end

  return false
end

local function updateHealth(index)
  if not ProbablyEngine.raid.roster[index] then
    return
  end

  local unit = ProbablyEngine.raid.roster[index].unit

  local incomingHeals = UnitGetIncomingHeals(unit) or 0
  local absorbs = UnitGetTotalHealAbsorbs(unit) or 0

  local health = UnitHealth(unit) + incomingHeals - absorbs
  local maxHealth = UnitHealthMax(unit)

  ProbablyEngine.raid.roster[index].health = health / maxHealth * 100
  ProbablyEngine.raid.roster[index].healthMissing = maxHealth - health
  ProbablyEngine.raid.roster[index].maxHealth = maxHealth  
end

ProbablyEngine.raid.updateHealth = function (unit)
  if type(unit) == 'number' then
    return updateHealth(unit)
  end

  if unit == 'focus' then return updateHealth(-2) end
  if unit == 'target' then return updateHealth(-1) end
  if unit == 'player' then return updateHealth(0) end


  local prefix = (IsInRaid() and 'raid') or 'party'
  if unit:find(prefix) then
    return updateHealth(tonumber(unit:sub(#prefix + 1)))
  end
end

ProbablyEngine.raid.build = function()
  local groupMembers = GetNumGroupMembers()
  local rosterLength = #ProbablyEngine.raid.roster
  local prefix = (IsInRaid() and 'raid') or 'party'

  local i, unit
  for i = -2, groupMembers do
    unit = (i == -2 and 'focus') or (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i

    if not ProbablyEngine.raid.roster[i] then ProbablyEngine.raid.roster[i] = {} end

    ProbablyEngine.raid.roster[i].unit = unit
    if UnitExists(unit) and not UnitIsDeadOrGhost(unit) and UnitIsConnected(unit) then
      ProbablyEngine.raid.roster[i].role = UnitGroupRolesAssigned(unit)
      updateHealth(i)
    end
  end

  if groupMembers > rosterLength then
    return
  end

  for i = groupMembers + 1, rosterLength do
    ProbablyEngine.raid.roster[i] = nil
  end
end

ProbablyEngine.raid.calShieldHp = function(t)
	local inc = UnitGetIncomingHeals(t) and UnitGetIncomingHeals(t) or 0
	local cur
  -- Check for Malkorok Shields
  if UnitDebuff(t, 142861, 'any') then
    cur = (select(5,UnitDebuff(t, 142863, 'any'))
    or select(5,UnitDebuff(t, 142864, 'any'))
    or select(5,UnitDebuff(t, 142865, 'any'))
    or (UnitHealthMax(t) / 2)
    or 400000)
  else
    cur = UnitHealth(t)
  end
	local pinc = 100 * ( cur + inc ) / UnitHealthMax(t)
	local valinc = ( UnitHealthMax(t) - ( cur + inc ) )
	if pinc and valinc then
    if pinc > 0 then
      return pinc, valinc
    else
      return 100,UnitHealthMax("player")
    end
	else
		return 100,UnitHealthMax("player")
	end
end


ProbablyEngine.raid.lowestHP = function()
  local lowestUnit = 'player'
  if canHeal('focus') then lowestUnit = 'focus' end

  local lowest = 100

  for _, unit in pairs(ProbablyEngine.raid.roster) do
    if canHeal(unit.unit) and unit.health and unit.health < lowest then
      lowest = unit.health
      lowestUnit = unit.unit
    end
  end

  return lowestUnit
end

ProbablyEngine.raid.raidPercent = function()
  local total = 0
  for k,v in pairs(ProbablyEngine.raid.roster) do
    total = total + v
  end
  if total > 0 and #ProbablyEngine.raid.roster > 0 then
    return total / #ProbablyEngine.raid.roster
  end
  return 100
end

ProbablyEngine.raid.needsHealing = function(threshold)
  if not threshold then threshold = 80 end
  local needsHealing = 0
  for target, per in pairs(ProbablyEngine.raid.roster) do
    if per <= threshold and per ~= 0 then
      needsHealing = needsHealing + 1
    end
  end
  return needsHealing
end

ProbablyEngine.raid.tank = function()
  if canHeal('focus') then
    return 'focus'
  end

  local tank = 'player'
  local highestUnit

  local lowest, highest = 100, 0
  for _, unit in pairs(ProbablyEngine.raid.roster) do
    if canHeal(unit.unit) then
      if unit.role == 'TANK' then
        if unit.health and unit.health < lowest then
          lowest = unit.health
          tank = unit.unit
        end
      else
        if unit.maxHealth and unit.maxHealth > highest then
          highest = unit.maxHealth
          highestUnit = unit.unit
        end
      end
    end
  end

  if GetNumGroupMembers() > 0 and tank == 'player' then
    tank = highestUnit
  end

  return tank
end
