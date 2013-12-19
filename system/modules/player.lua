-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local player = {
  cast_cache = {},
  behind = false,
  behindTime = 0,
  infront = true,
  infrontTime = 0
}

function player.cast(spell)
  table.insert(ProbablyEngine.module.player.cast_cache, 1, spell)
  if #ProbablyEngine.module.player.cast_cache > 10 then
    table.remove(ProbablyEngine.module.player.cast_cache)
  end
end

function player.casted(query)
  local count = 0
  for _, spell in ipairs(ProbablyEngine.module.player.cast_cache) do
    if spell == query then
        count = count + 1
    else
      return count
    end
  end
  return 0
end

ProbablyEngine.module.register("player", player)
