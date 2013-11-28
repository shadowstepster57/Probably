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

  -- Cooldowns
  {{
    { "Bloodbath" },
    { "Avatar" },
    { "Recklessness", "target.range <= 4" },
    { "Skull Banner" },
    { "Bladestorm", "target.range <= 4" },
  }, "modifier.cooldowns" },

  -- AoE
  {{
    { "Sweeping Strikes" },
    {{
      { "Thunder Clap" },
      { "Whirlwind" },
      { "Dragon Roar" },
    }, "target.range <= 4" }, -- why range 4? these are all 8
    { "Cleave", "player.rage > 60" },
  }, "modifier.multitarget" },

  -- Rotation
  { "Shield Slam" },
  { "Revenge" },
  { "Devastate" },
  { "Heroic Throw" },
  { "Heroic Strike", "player.buff(Ultimatum)" },
  { "Thunder Clap", { "!target.debuff(Weakened Blows)", "target.range <= 8" } }

})
