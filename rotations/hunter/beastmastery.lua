-- SPEC ID 253
ProbablyEngine.library.register('coreHunter', {
    petInRange = function()
        return (IsSpellInRange('Growl', 'target') == 1)
    end,
})
ProbablyEngine.rotation.register(253, {

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
  
    -- Pet
    { "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.alive" },
    { "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.exists" },

    -- Traps
    { "Snake Trap"    , "modifier.control", "ground" },
    { "Explosive Trap", "modifier.alt", "ground" },
    { "Freezing Trap" , "modifier.shift", "ground" },

    { "Silencing Shot", "modifier.interrupts" },

    -- Survival
    { "Deterrence", "player.health < 40" },
    { "Exhilaration", "player.health < 40" },
    { "Mend Pet", {
        "pet.health <= 75",
        "pet.exists",
        "!pet.buff(Mend Pet)"
    }},

    -- Cooldowns
    { "Bestial Wrath", {
        "modifier.cooldowns",
        "player.spell(Kill Command).cooldown = 0"
    }},
    { "Kill Command", {
        "pet.exists",
        "@coreHunter.petInRange"
    }},


    { "Stampede", "modifier.cooldowns" },
    { "A Murder of Crows", "modifier.cooldowns" },
    { "Dire Beast", "modifier.cooldowns" },
    { "Rapid Fire", "modifier.cooldowns" },

    -- Rotation
    { "Serpent Sting", "!target.debuff(Serpent Sting)" },
    { "Steady Shot", "target.debuff(Serpent Sting).duration < 4" },
    { "Focus Fire", {
        "player.buff(Frenzy).count = 5",
        "!player.buff(Bestial Wrath)"
    } },

    { "Glaive Toss" },
    { "Powershot" },
    { "Barrage" },
    { "Dire Beast" },
    { "Fervor" },
    { "Arcane Shot", "player.focus >= 60"},
    { "Arcane Shot", {
        "player.buff(Thrill of the Hunt)",
        "player.focus >= 20"
    }},
    { "Cobra Shot" }

  }
)
