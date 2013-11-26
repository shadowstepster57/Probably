-- SPEC ID 62
ProbablyEngine.rotation.register(62, {

  -- Cooldowns
  { "Ice Block", {"modifier.cooldowns", "player.health <= 30"} },
  { "Cold Snap", {"modifier.cooldowns", "player.health <= 25", "player.spell(Ice Block).cooldown"} },
  { "Mirror Image", "modifier.cooldowns" },
  { "Presence of Mind", "modifier.cooldowns" },
  { "Temporal Shield", { "modifier.cooldowns", "player.health <= 80"} },
  
  -- Alter Time Logic
  { "Alter Time", {
    "player.buff(Arcane Power)",
    "!player.buff(Alter Time)",
    "toggle.alter"
  }},
  
  -- Interrupts
  { "Counterspell", "modifier.interrupts" },
  { "Frostjaw", "modifier.interrupts" },
  
  -- Gems
  { "!/use Mana Gem", "player.mana <= 70" },
  { "!/use Brilliant Mana Gem", "player.mana <= 70" },
  
  -- Mage Bombs
  { "Nether Tempest", "!target.debuff(Nether Tempest)", "target" }, 
  { "Nether Tempest", "target.debuff(Nether Tempest).duration <= 2", "target" },
  { "Living Bomb", "!target.debuff(Living Bomb)", "target" },
  { "Frost Bomb", "player.spell(Frost Bomb).cooldown = 0", "target" },
  
  -- Survivability
  { "Frost Nova", "target.range <= 9" },
  { "Blink", "target.range <= 3" },
  { "Rune of Power", "modifier.shift", "ground" },
  { "Ice Barrier", "player.health <= 80" },
  
  -- AoE
  --{ "Blizzard", "modifier.ctrl", "ground" }, -- Unimplemented
  { "Flamestrike", "modifier.control", "ground" }, 
  { "Ring of Frost", "modifier.alt", "ground" }, 
  
  -- Moving
  { "Arcane Barrage", "player.moving" },
  { "Fire Blast", "player.moving" },
  { "Ice Lance", {"player.moving", "player.spell(Fire Blast).cooldown", "player.spell(Arcane Barrage).cooldown"} },

  -- Opener
  { "Arcane Power", {
      "player.buff(Arcane Missiles!).count >= 2",
      "toggle.alter"
  }},

  -- Rotation
  { "Arcane Missiles", {
      "player.buff(Arcane Missiles!).count >= 1",
      "player.debuff(Arcane Charge).count >= 4"
  }},
  { "Arcane Barrage", {
      "player.debuff(Arcane Charge).count >= 4",
      "!player.buff(Arcane Missiles)"
  }},
  { "Arcane Blast" }
  },
  { { "Arcane Brilliance", "!player.buff" },
  { "Frost Armor", "!player.buff(Molten Armor)", "!player.spell(Molter Armor).exists" },
  { "Molten Armor", "!player.buff(Molten Armor)", "!player.spell(Mage Armor).exists" },
  { "Mage Armor", "!player.buff(Mage Armor)" } }
, function()
  ProbablyEngine.toggle.create('alter', 'Interface\\ICONS\\spell_mage_altertime', 'Alter Time', 'Toggle the usage of Alter Time and Arcane Power.')
end)
