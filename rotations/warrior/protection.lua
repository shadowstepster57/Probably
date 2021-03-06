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
  { "Pummel", "modifier.interrupts" },
  { "Disrupting Shout", "modifier.interrupts" },

  -- Cooldowns
  { "Bloodbath", "modifier.cooldowns" },
  { "Avatar", "modifier.cooldowns" },
  { "Recklessness", "modifier.cooldowns", "target.range <= 4" },
  { "Skull Banner", "modifier.cooldowns" },
  { "Bladestorm", "modifier.cooldowns", "target.range <= 4" },

  -- AoE
  { "Sweeping Strikes", "modifier.multitarget" },
  { "Thunder Clap", "modifier.multitarget", "target.range <= 4" },
  { "Whirlwind", "modifier.multitarget", "target.range <= 4" },
  { "Dragon Roar", "modifier.multitarget", "target.range <= 4" },
  { "Cleave", {
    "modifier.multitarget",
    "player.rage > 60"
  }},

  -- Rotation
  { "Shield Slam" },
  { "Revenge" },
  { "Devastate" },
  { "Heroic Throw" },
  { "Heroic Strike", "player.buff(Ultimatum)" },
  { "Thunder Clap", "!target.debuff(Weakened Blows)", "target.range <= 8"}

})
