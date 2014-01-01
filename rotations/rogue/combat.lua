-- SPEC ID 260
ProbablyEngine.rotation.register(260, {

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
  { "Deadly Poison", "!player.buff(Deadly Poison)" },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },

  -- Interrupts
  { "Kick", "modifier.interrupts" },

  -- Cooldowns
  { "Adrenaline Rush", "modifier.cooldowns" },
  { "Killing Spree", {
    "modifier.cooldowns",
    "player.energy <= 20",
    "!player.buff(Adrenaline Rush)"
  }},
  { "Shadow Blades", {
    "modifier.cooldowns",
    "player.buff(Adrenaline Rush)"
  }},

  -- Blade Flurry
  { "Blade Flurry", {
    "!modifier.multitarget",
    "player.buff(Blade Flurry)"
  }},
  { "Blade Flurry", {
    "modifier.multitarget",
    "!player.buff(Blade Flurry)"
  }},

  -- Rotation
  { "Marked for Death", "player.combopoints = 0" },
  { "Slice and Dice", {
    "!player.buff(Slice and Dice)",
    "player.combopoints = 5"
  }},
  { "Revealing Strike", "target.debuff(Revealing Strike).duration <= 6" },
  { "Rupture", {
    "target.debuff(Rupture).duration <= 8",
    "player.combopoints = 5"
  }},
  { "Eviscerate", "player.combopoints = 5" },
  { "Fan of Knives", "modifier.multitarget" },
  { "Sinister Strike" },

})
