-- SPEC ID 73
ProbablyEngine.rotation.register(73, {

  -- Buffs
  { "Berserker Rage" },

  -- Survival CDs
  { "Rallying Cry", {
    "player.health < 10",
    "modifier.cooldowns"
  }},
  { "Last Stand", {
   "player.health < 20",
   "modifier.cooldowns"
  }},
  { "Shield Wall", {
   "player.health < 30",
   "modifier.cooldowns"
  }},
  { "Impending Victory" },
  { "Victory Rush" },

  -- Survival Buffs
  { "Shield Block", "!player.buff(Shield Block)" },
  { "Shield Barrier", {
    "!player.buff(Shield Barrier)",
    "player.rage > 80"
  }},

  -- Taunts
  { "Taunt", "modifier.taunt" },

  -- Kicks
  {{
    { "Pummel" },
    { "Disrupting Shout" },
  }, "modifier.interrupts" },

  -- Ranged
  { "Heroic Throw", "target.range >= 10" },
  { "Throw", {
    "target.range >= 10",
    "!player.moving"
  }},

  -- Cooldowns
  {{
    { "Bloodbath" },
    { "Avatar" },
    { "Recklessness", "target.range <= 8" },
    { "Skull Banner" },
    { "Bladestorm", "target.range <= 8" },
  }, "modifier.cooldowns" },

  -- AoE
  {{
    { "Sweeping Strikes" },
    {{
      { "Thunder Clap" },
      { "Whirlwind" },
      { "Dragon Roar" },
    }, "target.range <= 5" },
    { "Cleave", "player.rage > 60" },
  }, { "modifier.multitarget" } },

  -- Rotation
  { "Shield Slam" },
  { "Revenge", {
    "player.rage <= 80"
  }},
  -- Bleed
  { "Devastate", "!target.debuff(Deep Wounds)" },
  -- Weakened Armor
  { "Devastate", {
    "target.debuff(Weakened Armor).count < 3"
  }},
  { "Sunder Armor", {
    "player.level < 26",
    "target.debuff(Weakened Armor).count < 3"
  }},
  -- Weakened Blows
  { "Thunder Clap", {
    "!target.debuff(Weakened Blows).any",
    "target.range <= 5"
  }},
  -- Filler
  { "Devastate" },

}, {

}, function()
  ProbablyEngine.toggle.create('taunt', 'Interface\\ICONS\\spell_nature_reincarnation', 'Taunt', 'Toggle the usage of Taunt.')
end)
