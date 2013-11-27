-- SPEC ID 64
ProbablyEngine.rotation.register(64, {

  -- Cooldowns
  { "Icy Veins", "modifier.cooldowns" },
  { "Ice Block", {"modifier.cooldowns", "player.health <= 30"} },
  { "Cold Snap", {"modifier.cooldowns", "player.health <= 25", "player.spell(Ice Block).cooldown"} },
  { "Mirror Image", "modifier.cooldowns" },
  { "Alter Time", "modifier.cooldowns" },
  { "Presence of Mind", "modifier.cooldowns" },
  { "Temporal Shield", { "modifier.cooldowns", "player.health <= 80"} },
  
  -- Interrupts
  { "Counterspell", "modifier.interrupts" },
  { "Frostjaw", "modifier.interrupts" },

  -- AoE
  { "Blizzard", "modifier.control", "ground" },
  { "Ring of Frost", "modifier.alt", "ground" },
  
  -- Mage Bombs
  {"Nether Tempest", "!target.debuff(Nether Tempest)", "target"}, 
  {"Nether Tempest", "target.debuff(Nether Tempest).duration <= 2", "target"},
  {"Living Bomb", "!target.debuff(Living Bomb)", "target"},
  {"Frost Bomb", "player.spell(Frost Bomb).cooldown = 0", "target"},
  
  -- Survivability
  { "Frost Nova", "target.range <= 9" },
  { "Blink", "target.range <= 3" },
  { "Rune of Power", "modifier.shift", "ground" },
  { "Ice Barrier", "player.health <= 80" },
  
  -- Rotation
  { "Frozen Orb", "player.buff(Fingers of Frost).count < 2" },
  { "Ice Lance", "player.buff(Fingers of Frost)" },
  { "Frostfire Bolt", "player.buff(Brain Freeze)" },
  { "Ice Lance", "player.moving" },
  { "Frostbolt" }},
  
{{ "Arcane Brilliance", "!player.buff" },
  { "Frost Armor", "!player.buff" }})
