-- SPEC ID 63
ProbablyEngine.rotation.register(63, {

  -- Cooldowns
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
  --{ "Blizzard", "modifier.ctrl", "ground" }, -- Unimplemented
  { "Flamestrike", "modifier.control", "ground" },
  { "Ring of Frost", "modifier.alt", "ground" },
	
  -- Mage Bombs
  { "Nether Tempest", "!target.debuff(Nether Tempest)", "target" }, 
  { "Nether Tempest", "target.debuff(Nether Tempest).duration <= 2", "target" },
  { "Living Bomb", "!target.debuff(Living Bomb)", "target" },
  { "Frost Bomb", "player.spell(Frost Bomb).cooldown = 0", "target" },
  
  -- Survivability
  { "Frost Nova", "target.range <= 9" },
  { "Blink", "target.range <= 3" },
  { "Dragon's Breath", "target.range <= 5"},
  { "Rune of Power", "modifier.shift", "ground" },
  { "Ice Barrier", "player.health <= 80" },
  
  -- Rotation
  { "Combustion",  "target.debuff(Ignite)" },
  { "Pyroblast", "player.buff(Pyroblast!)" },
  { "Inferno Blast", "player.buff(Heating Up)" },
  { "Living Bomb", "target.debuff(Living Bomb).duration <= 3" },
  { "Scorch", "player.moving" },
  { "Fireball" }
  },
{{ "Arcane Brilliance", "!player.buff" },
 { "Molten Armor", "!player.buff(Molten Armor)" },})
