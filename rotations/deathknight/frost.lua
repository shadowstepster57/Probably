-- SPEC ID 251
ProbablyEngine.rotation.register(251, {

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

  -- Survival
  -- Death Pact Macro
  { "!/cast Raise Dead\n/cast Death Pact", {
    "player.health < 35",
    "player.spell(Death Pact).cooldown",
    "player.spell(Raise Dead).cooldown",
    "player.spell.usable(Death Pact)"
  }},


  -- Keep up dots
  { "Outbreak", "!target.debuff(Blood Plague)" },
  { "Outbreak", "!target.debuff(Frost Fever)" },
  { "Soul Reaper", "target.health < 30" },
  { "Plague Strike", "!target.debuff(Blood Plague)" },
  --{ "Howling Blast", "player.buff(Rime)" },
  { "Obliterate", "player.buff(Killing Machine)" },
  { "Frost Strike", "player.runicpower >= 80"},
  { "Obliterate" },
  --{ "Howling Blast", "player.buff(Freezing Fog)" },
  { "Howling Blast", "player.runes(frost) = 2" },
  { "Horn of Winter" },
  }
)
