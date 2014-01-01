-- Class ID 9 - The OP
ProbablyEngine.rotation.register(265, {

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

  -- Gnomes
  { "Escape Artist", "player.state.root" },
  { "Escape Artist", "player.state.snare" },

  -- <,&~ Horde ~&,> --
  -- Forsaken
  { "Will of the Forsaken", "player.state.fear" },
  { "Will of the Forsaken", "player.state.charm" },
  { "Will of the Forsaken", "player.state.sleep" },
  
  -- Goblins
  { "Rocket Barrage", "player.moving" },

  { "Curse of the Elements", "!target.debuff(Curse of the Elements)" },

  -- Soul Burn + Soul Swap
  {{
    { "Soulburn", "!player.buff(Soulburn)" },
    { "Soul Swap", "player.buff(Soulburn)" },
  }, {
    "target.debuff(Agony).duration <= 3",
    "target.debuff(Corruption).duration <= 3",
    "target.debuff(Unstable Affliction).duration <= 3",
  }},

  { "Fel Flame", "player.moving" },

  { "Agony", "target.debuff(Agony).duration <= 3" },
  { "Corruption", "target.debuff(Corruption).duration <= 3" },
  { "Unstable Affliction", "target.debuff(Unstable Affliction).duration <= 3" },

  { "Haunt", "!target.debuff(Haunt)" },

  { "Drain Soul", "target.health <= 20" },
  { "Malefic Grasp" },

})
