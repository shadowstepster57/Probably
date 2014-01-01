-- Class ID 5 - Two Button Masher
ProbablyEngine.rotation.register(5, {

  -- Mouseover
  { "Shadow Word: Pain", {"modifier.shift", "!mouseover.debuff(Shadow Word: Pain)"}, "mouseover" },
  
  -- Survival
  { "Power Word: Shield", "player.health <= 95" },
  { "Flash Heal", "player.health <= 60 },

  -- Rotation
  { "Shadow Word: Pain", "!target.debuff(Shadow Word: Pain)" },
  { "Smite" },
  }
)
