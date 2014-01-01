-- SPEC ID 261
ProbablyEngine.rotation.register(261, {
  
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
  
  -- Interrupts
  { "Kick", "modifier.interrupts" },
  -- Buffs
  { "Deadly Poison", { "!player.buff(Deadly Poison)", "!player.moving" } },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },
  -- Cooldowns
  { "Shadow Blades", "modifier.cooldowns" },
  { "Slice and Dice", {
    "!player.buff(Slice and Dice)",
    "player.combopoints = 5"
  }},
  { "Vanish", {
    "!player.buff(Shadow Dance)",
    "modifier.cooldowns"
  }},
  -- Rotation
  { "Eviscerate", "player.combopoints = 5" },
  { "Hemorrhage", "target.debuff(Hemorrhage).duration <= 4" },
  {{
    { "Fan of Knives", "modifier.multitarget" },
    { "Backstab", "player.behind" },
    { "Hemorrhage", "!player.behind" },
    { "Hemorrhage", { "!player.spell(Backstab).exists", "player.behind" } },
  }, "player.combopoints < 5" },

}, {
  { "Deadly Poison", { "!player.buff(Deadly Poison)", "!player.moving" } },
  { "Ambush", { "player.buff(Stealth)", "target.spell(Ambush).range" }, "target" },
})
