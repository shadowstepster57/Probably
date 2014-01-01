-- SPEC ID 250
ProbablyEngine.rotation.register(250, {

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

  -- <,&~ Horde ~&,> --
  -- Forsaken
  { "Will of the Forsaken", "player.state.fear" },
  { "Will of the Forsaken", "player.state.charm" },
  { "Will of the Forsaken", "player.state.sleep" },
  
  -- Goblins
  { "Rocket Barrage", "player.moving" },
  
  -- _,-=%Pandaren%=-,_ --
  { "Quaking Palm", "modifier.interrupts" },
  
  -- defensive
  { "Bone Shield", "!player.buff" },

  -- Interrupts
  { "Mind Freeze", "modifier.interrupts" },

  -- Taunts
  { "Dark Command", "modifier.taunt" },
  { "Death Grip", "modifier.taunt" },

  -- Survival
  { "Anti-Magic Shell", "player.health < 70" },
  { "Dancing Rune Weapon", "player.health < 60" },
  { "Conversion", "player.health < 60" },
  { "Vampiric Blood", "player.health < 55" },
  { "Icebound Fortitude", "player.health < 50" },
  { "Rune Tap", "player.health < 40" },
  { "Empower Rune Weapon", "player.health < 40" },

  -- Death Pact Macro
  { "!/cast Raise Dead\n/cast Death Pact", {
    "player.health < 35",
    "player.spell(Death Pact).cooldown",
    "player.spell(Raise Dead).cooldown",
    "player.spell(Death Pact).usable"
  }},

  -- hard cast dnd
  { "Death and Decay", "modifier.shift", "ground" },

  { "Blood Tap", "player.buff(Blood Charge).count >= 5" },

  -- Places dots
  { "Outbreak", "!target.debuff(Frost Fever)" },

  -- Refresh dots with Blood Boil
  { "Blood Boil", {
    "target.debuff(Frost Fever).duration < 4",
    "target.range <= 8"
  }},

  -- Refresh dots with hard casts
  { "Icy Touch", "target.debuff(Frost Fever).duration < 4" },
  { "Plague Strike", "target.debuff(Blood Plague).duration < 4" },

  -- Rotation
  { "Heart Strike", "player.runes(blood).count >= 1" },
  { "Death Strike" },
  { "Blood Boil", {
    "player.buff(Crimson Scourge)",
    "target.range <= 8"
  }},
  { "Blood Boil", {
    "modifier.multitarget",
    "target.range <= 8"
  }},
  { "Soul Reaper", "target.health < 35" },
  { "Rune Strike" },
  { "Horn of Winter" },
})


