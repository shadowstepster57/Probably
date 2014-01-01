-- Class ID 4 - 1337 P14Y3R
ProbablyEngine.rotation.register(8, {

  -- Keybinds
  { "Throw", "modifier.shift" },
  
  -- Survival
  { "Evasion", "player.health <= 75" },
  
  -- Opener
  { "Stealth", "target.enemy" },
  { "Ambush", "player.buff(Stealth)" },
  
  -- Rotation
  { "Eviscerate", "player.combopoints >= 4" },
  { "Sinister Strike" },
)
