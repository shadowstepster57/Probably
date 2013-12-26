-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.listener.register("PLAYER_LOGIN", function(...)
  ProbablyEngine.rotation.auto_unregister()
  ProbablyEngine.listener.trigger("PLAYER_SPECIALIZATION_CHANGED", "player")
  -- if not ProbablyEngine.full then
  --   ProbablyEngine.full_check()
  -- end

  ProbablyEngine.interface.init()
  ProbablyEngine.module.player.init()
  ProbablyEngine.raid.build()
end)
