-- SPEC ID 250
ProbablyEngine.rotation.register(250, {

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
  
  -- Keybinds
  { "Death and Decay", "modifier.shift", "ground" },
  
  -- Defensives and Buffing
  { "Bone Shield", "player.buff(Bone Shield).charges < 1" },
  { "Horn of Winter" },

  -- Battle Rez, Mouseover w/ Cooldowns Mod
  { "Raise Ally", "modifier.cooldowns", "!mouseover.alive", "mouseover" },
  
  -- Interrupts
  { "Mind Freeze", "modifier.interrupts" },
  { "Strangulate", "modifier.interrupts" },

  -- Threat Control w/ Toggle
  { "Dark Command", { "toggle.tc", "mouseover.threat < 100" }, "mouseover" },
  { "Dark Command", { "toggle.tc", "target.threat < 100" }, "target" },
  { "Death Grip", { "toggle.tc", "mouseover.threat < 100" }, "mouseover" },
  { "Death Grip", { "toggle.tc", "target.threat < 100" }, "target" },

  -- Survival
  { "Anti-Magic Shell", "player.health <= 70", "target.casting" },
  { "Dancing Rune Weapon", "player.health <= 75" },
  { "Conversion", "player.health <= 60" },
  { "Vampiric Blood", "player.health <= 55" },
  { "Icebound Fortitude", "player.health <= 50" },
  { "Rune Tap", "player.health <= 40" },
  { "Empower Rune Weapon", "player.health <= 40" },
  -- Death Pact Macro, Last Resort
  { "/cast Raise Dead\n/cast Death Pact", { "player.health < 35", "player.spell(Death Pact).cooldown", "player.spell(Raise Dead).cooldown", "player.spell(Death Pact).usable" } },

  -- Blood Tap Control
  { "Blood Tap", "player.buff(Blood Charge).count >= 5" },
  
  -- Disease Control
  { "Outbreak", "target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3", "target" },
  { "Blood Boil", "player.runes(blood).count > 1","target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3" },
  { "Blood Boil", "player.runes(death).count > 1","target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3" },  
  { "Icy Touch", "target.debuff(Frost Fever).duration < 3" },
  { "Plague Strike", "target.debuff(Blood Plague).duration < 3" },
  
  -- AoE Rotation
  { "Pestilence", "target.debuff(Blood Plague", "target.debuff(Frost Fever)" },
  { "Death Strike", "modifier.multitarget" },
  { "Blood Boil", "modifier.multitarget" },
  { "Rune Strike", "modifier.multitarget" },

  -- Rotation
  { "Heart Strike", "player.runes(blood).count >= 1", "target.health > 35" },
  { "Soul Reaper", "player.runes(blood).count >= 1", "target.health < 35" },
  { "Death Strike", "!modifier.last(Death Strike)" },
  { "Rune Strike", "player.runicpower >= 40" },
  
  ------------------
  -- End Rotation --
  ------------------
  
},{
  
  ---------------
  -- OOC Begin --
  ---------------
  
    -- Buffs
  { "Horn of Winter" },
  { "Path of Frost", "!player.buff(Path of Frost).any" },
  { "Bone Shield", "player.buff(Bone Shield).charges < 1" },
  
  -- Keybinds
  { "Army of the Dead", "modifier.alt" },
  { "Death Grip", "modifier.control" },
  
  -------------
  -- OOC End --
  -------------
  
  },
 function ()
  ProbablyEngine.toggle.create('tc', 'Interface\\Icons\\ability_deathwing_bloodcorruption_death', 'Threat Control', '')
  end)
