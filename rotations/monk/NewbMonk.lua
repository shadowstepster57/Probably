-- Class ID 10 - Four Line Killing Machine
ProbablyEngine.rotation.register(10, {

  -- Blink
  { "Roll", "modifier.shift" },

  -- Rotation
  { "Tiger Palm", "player.buff(Tiger Power).duration < 3" },
  { "Blackout Kick" },
  { "Jab" },
  
  }
)
