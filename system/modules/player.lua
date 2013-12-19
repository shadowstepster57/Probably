-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local UnitClass = UnitClass

local player = {
  castCache = {},
  behind = false,
  behindTime = 0,
  infront = true,
  infrontTime = 0
}

function player.init()
  local _, _, classID = UnitClass('player')
  player.classID = classID
end

local nextCastIndex = 1
function player.cast(spell)
  player.castCache[nextCastIndex] = spell
  nextCastIndex = nextCastIndex % 10 + 1
end

function player.casted(query)
  local count = 0

  for i = 1, 10 do
    if query == player.castCache[i] then
      count = count + 1
    end
  end

  return count
end

ProbablyEngine.module.register("player", player)
