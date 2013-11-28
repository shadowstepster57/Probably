-- SPEC ID 71
ProbablyEngine.rotation.register(71, {

  -- Buffs
  { "Berserker Rage" },

  -- Survival
  { "Rallying Cry", {
    "player.health <= 35",
  }},

  { "Shield Wall", {
    "player.health <= 55"
  }},

  { "Die by the Sword", {
    "player.health <= 65",
  }},

  { "Hamstring", {
    "!target.debuff(Hamstring)",
    "modifier.player"
  }},

  { "Impending Victory" },
  { "Victory Rush" },

  -- Interrupts
  { "Pummel", "modifier.interrupts" },
  { "Disrupting Shout", "modifier.interrupts" },

  -- Cooldowns
  {{
    { "Bloodbath" },
    { "Avatar" },
    { "Recklessness" },
    { "Skull Banner" },
    { "Bladestorm" },
  }, "modifier.cooldowns" },

  -- AoE
  {{
    { "Sweeping Strikes" },
    {{
      { "Thunder Clap" },
      { "Whirlwind" },
      { "Dragon Roar" },
    }, "target.range <= 5" },
  }, "modifier.multitarget" },

  -- Rotation
  { "Overpower" },
  { "Mortal Strike" },
  { "Colossus Smash" },
  { "Heroic Throw" },
  { "Heroic Strike", {
    "player.rage > 70",
    "target.debuff(Colossus Smash)"
  }},
  { "Slam", "player.rage > 40" },
  { "Execute" },

})
