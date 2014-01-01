-- SPEC ID 64
ProbablyEngine.rotation.register(64, {

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
  
  -- _,-=%Pandaren%=-,_ --
  { "Quaking Palm", "modifier.interrupts" },
  
  -----------------
  -- End Racials --
  -----------------
  
  --------------------
  -- Start Rotation --
  --------------------
  
  -- Cooldowns
  { "12472", "modifier.cooldowns" }, -- Icy Veins
  { "45438", {"modifier.cooldowns", "player.health <= 30"} }, -- Ice Block
  { "11958", {"modifier.cooldowns", "player.health <= 25", "player.spell(45438).cooldown"} }, -- Cold Snap
  { "55342", "modifier.cooldowns" }, -- Mirror Image
  { "108978", "modifier.cooldowns" }, -- Alter Time
  { "12043", "modifier.cooldowns" }, -- Presence of Mind
  { "115610", { "modifier.cooldowns", "player.health <= 80"} }, -- Temporal Shield
  
  -- Interrupts
  { "2139", "modifier.interrupts" }, -- Counterspell
  { "102051", "modifier.interrupts" }, -- Frostjaw

  -- AoE
  { "10", "modifier.control", "ground" }, -- Blizzard
  { "113724", "modifier.alt", "ground" }, -- Ring of Frost
  
  -- Mage Bombs
  {"114923", "!target.debuff(114923)", "target"}, -- Nether Tempest
  {"114923", "target.debuff(114923).duration <= 2", "target"}, -- Nether Tempest
  {"44457", "!target.debuff(44457)", "target"}, -- Living Bomb
  {"112948", "player.spell(112948).cooldown = 0", "target"}, -- Frost Bomb
  
  -- Survivability
  { "122", "target.range <= 9" }, -- Frost Nova
  { "1953", "target.range <= 3" }, -- Blink
  { "116011", "modifier.shift", "ground" }, -- Rune of Power
  { "11426", "player.health <= 80" }, -- Ice Barrier
  
  -- Rotation
  { "84714", "player.buff(112965).count < 2" }, -- Frozen Orb
  { "30455", "player.buff(112965)" }, -- Ice Lance
  { "44614", "player.buff(44549)" }, -- Frostfire Bolt
  { "30455", "player.moving" }, -- Ice Lance
  { "116" } -- Frostbolt

  ------------------
  -- End Rotation --
  ------------------
  },{
  
  ---------------
  -- OOC Begin --
  ---------------
  
  { "1459", "!player.buff" }, -- Arcane Brilliance
  { "7302", "!player.buff" } -- Frost Armor
  
  -------------
  -- OOC End --
  -------------
  
  })
