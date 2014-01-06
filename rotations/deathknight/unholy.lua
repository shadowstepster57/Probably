-- SPEC ID 252
ProbablyEngine.rotation.register(252, {

  -------------------
  -- Start Racials --
  -------------------
  
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
  
  -----------------
  -- End Racials --
  -----------------
  
  --------------------
  -- Start Rotation --
  --------------------
  
  -- Cooldowns
  { "Unholy Frenzy", "modifier.cooldowns" },
  { "Summon Gargoyle", "modifier.cooldowns" },
  { "Anti-Magic Zone", "modifier.cooldowns" },
  { "Death's Advance", { "modifier.cooldowns", "target.range >= 25" } },
  { "Desecrated Ground", "modifier.cooldowns" },
  { "Army of the Dead", "modifier.cooldowns" },
  { "Anti-Magic Shell", "modifier.cooldowns" },
  { "Empower Rune Weapon", {"modifier.cooldowns", "player.runes(frost).0", "player.runes(blood).0", "player.runes(unholy).0","player.runes(death).0" } },  
  { "Dark Simulacrum", "modifier.cooldowns" },
  
  -- Survival
  { "Death Siphon", "player.health <= 80" },
  { "Death Pact", "player.health <= 30" },
  { "Icebound Fortitude", "player.health <= 50" },
  { "Conversion", "player.health <= 55" },
  
  -- Interrupts
  { "Asphyxiate", {"modifier.interrupt", "target.casting", "player.spell(Asphyxiate).exists"} },
  { "Strangulate", "modifier.interrupt" },
  
  -- Keybinds
  { "Death and Decay", "modifier.shift", "ground" },
  { "Pestilence", "modifier.ctrl", "target" },
  { "Chains of Ice", "modifier.alt", "target" },
  
  -- In Combat Buffs 
  { "Horn of Winter" },
  { "Dark Transformation" },
  { "Raise Dead", "!pet.exists" },
  { "Unholy Frenzy" },
  
  -- MultiTarget
  { "Blood Boil", { "modifier.multitarget", "target.range <= 8" } },
  { "Blood Boil", { "player.buff(Crimson Scourge)", "target.range <= 8" } },
  
  -- Rotation
  { "Dark Transformation" },
  { "Outbreak", "!target.debuff(Frost Fever)", "!target.debuff(Blood Plague)" },
  { "Plague Strike", "target.debuff(Blood Plague).duration < 4", "target.debuff(Frost Fever).duration < 4" },
  { "Soul Reaper", "target.health < 35" },
  { "Death Coil", "player.buff(Sudden Doom)" },
  { "Festering Strike" },
  { "Scourge Strike" },
  { "Death Coil" },

  ------------------
  -- End Rotation --
  ------------------
  
},{

  ---------------
  -- OOC Begin --
  ---------------
  
  -- Buffs
  { "Horn of Winter", "!player.buff(Horn of Winter)" },
  { "Path of Frost", "!player.buff(Path of Frost).any" },
  
  -- Keybinds
  { "Army of the Dead", "modifier.alt" },
  { "Death Grip", "modifier.control" },
  
  -- Pet
  { "Raise Dead", "!pet.exists" },
  
  -------------
  -- OOC End --
  -------------
  }
)
