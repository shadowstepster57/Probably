-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.raid = {
  roster = { },
  roster_fast = { }
}


ProbablyEngine.raid.acquireTank = function()
  if UnitExists('focus') then
    return 'focus'
  else
    return 'player'
  end
end

ProbablyEngine.raid.build = function()
  if UnitInRaid("player") then
    for i = 1, 40 do
      local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(i);
      if online and UnitExists('raid' .. i)  then
        ProbablyEngine.raid.roster['raid' .. i] = ProbablyEngine.raid.calShieldHp('raid' .. i)
      elseif ProbablyEngine.raid.roster['raid' .. i] then
        ProbablyEngine.raid.roster['raid' .. i] = nil
      end
    end
    if online and UnitExists('target') then ProbablyEngine.raid.roster['target'] = ProbablyEngine.raid.calShieldHp('target') end
    if online and UnitExists('focus') then ProbablyEngine.raid.roster['focus'] = ProbablyEngine.raid.calShieldHp('focus') end
    -- needs controls
  elseif UnitInParty("player") then
    for i = 1, GetNumGroupMembers() do
      local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(i);
      if online and UnitExists('party' .. i) then
        ProbablyEngine.raid.roster['party' .. i] = ProbablyEngine.raid.calShieldHp('party' .. i)
      elseif ProbablyEngine.raid.roster['party' .. i] then
         ProbablyEngine.raid.roster['party' .. i] = nil
      end
    end
  end
  ProbablyEngine.raid.roster['player'] = ProbablyEngine.raid.calShieldHp('player')
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

local canHeal = function (unit)
if not UnitExists(unit) then return false end
if GetUnitName("player") == GetUnitName(unit) then return true end
if not select(1,UnitInRange(unit)) then return false end
if UnitCanAssist("player",unit)~=1 then return false end
if UnitIsFriend("player",unit)~=1 then return false end
if UnitInVehicle(unit)==1 then return false end
return true
end

ProbablyEngine.raid.lowestHP = function()
  local spairs = function(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
  end
  for k in spairs(ProbablyEngine.raid.roster, function(t, a, b) return t[b] > t[a] end) do
    if canHeal(k) then
   return k
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
  local possibleTank = false
  local highestHP = 100
  for target, health in pairs(ProbablyEngine.raid.roster) do
    local max = UnitHealthMax(target)
    if max > highestHP and health ~= 0 then
      highestHP = max
      possibleTank = target
    end
  end
  return possibleTank
end
