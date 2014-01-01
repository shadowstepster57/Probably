-- Class ID 7 - The Naturalist
ProbablyEngine.rotation.register(7, {

  -- Buffs
  { "Lightning Shield", "!player.buff(Lightning Shield)" },

  -- Survival
  { "Healing Surge", "player.health <= 75" },
  
  -- Rotation
  { "Primal Strike" },
  { "Earth Shock" },
  { "Lightning Bolt" },
  
  }
)
