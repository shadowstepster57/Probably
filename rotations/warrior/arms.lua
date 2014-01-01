-- SPEC ID 71
ProbablyEngine.rotation.register(71, {

  -- Racials (Temp)
  
  -- =^*~ Alliance ~*^= --
  -- Dwarves
  { "Stoneform", "player.health <= 65" },
 
  -- Humans
  { "Every Man for Himself", "player.state.charm" },
  { "Every Man for Himself", "player.state.fear" },
  { "Every Man for Himself", "player.state.incapacitate" },
  { "Every Man for Himself", "player.state.sleep" },
  { "Every Man for Himself", "player.state.stun" },
 
  -- Draenei
  { "Gift of the Naaru", "player.health <= 70", "player" },
 
  -- Gnomes
  { "Escape Artist", "player.state.root" },
  { "Escape Artist", "player.state.snare" },

  -- Night Elves
  { "Shadowmeld", "target.threat >= 80" },
  { "Shadowmeld", "focus.threat >= 80"},
  
  -- <,&~ Horde ~&,> --
  -- Forsaken
  { "Will of the Forsaken", "player.state.fear" },
  { "Will of the Forsaken", "player.state.charm" },
  { "Will of the Forsaken", "player.state.sleep" },
  
  -- Goblins
  { "Rocket Barrage", "player.moving" },
  
  -- _,-=%Pandaren%=-,_ --
  { "Quaking Palm", "modifier.interrupts" },
  
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
