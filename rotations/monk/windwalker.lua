-- SPEC ID 269
ProbablyEngine.rotation.register(269, {

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
  
  -- _,-=%Pandaren%=-,_ --
  { "Quaking Palm", "modifier.interrupts" },

  -----------------
  -- End Racials --
  -----------------
  
  --------------------
  -- Start Rotation --
  --------------------
  
  -- Get Fucked Button
  { "Touch of Death", "player.buff(Death Note)" },

  -- Interrupts
  { "Spear Hand Strike", "modifier.interrupts" },
  { "Grapple Weapon", "modifier.interrupts" },
  { "Leg Sweep", "modifier.interrupts", "target.range <= 5" },

  -- Survival
  { "Expel Harm", "player.health < 80" },
  { "Fortifying Brew", "player.health <= 30" },
  { "Touch of Karma", "player.health <= 50" },
  { "Nimble Brew", "player.state.fear" },
  { "Nimble Brew", "player.state.stun" },
  { "Nimble Brew", "player.state.root" },
  { "Nimble Brew", "player.state.horror" },
  { "Dampen Harm", "player.health <= 45" },
  { "Diffuse Magic", "player.health <= 45" },
  
  -- Keybinds
  { "Paralysis", "modifier.shift", "mouseover" },
  { "Healing Sphere", "modifier.alt", "ground" }, 
  { "Crackling Jade Lightning", "modifier.control", "target" },
  
  -- Cooldowns
  { "Invoke Xuen: The White Tiger", "modifier.cooldowns" },
  
  -- Talents
  { "Chi Wave" },
  { "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
  { "Chi Burst" },
  { "Invoke Xuen, the White Tiger" },
  { "Tiger's Lust", "target.range >= 15" },
  
  -- Multi-Target
  { "Rushing Jade Wind", "modifier.multitarget" },
  { "Spinning Crane Kick", "modifier.multitarget" },
  { "Fists of Fury", "modifier.multitarget", "player.energy < 30", "target.range <= 8", "player.chi >= 3" },
  
  --Brews
  { "Energizing Brew", "player.energy <= 45" },
  { "Tigereye Brew", "player.buff(Tigereye Brew).count >= 10" },
  { "Chi Brew", "player.chi <= 1" },
  
  -- Rotation
  { "Jab" },
  { "Rising Sun Kick" },
  { "Tiger Palm", "player.buff(Tiger Power).duration <= 2" },
  { "Tiger Palm", "player.buff(Combo Breaker: Tiger Palm)" },
  { "Blackout Kick", "player.buff(Combo Breaker: Blackout Kick)" },
  { "Blackout Kick", { "player.chi >= 2", "target.debuff(Rising Sun Kick)", "player.buff(Tiger Power)"} },
  { "Fists of Fury", "player.energy < 30", "target.range <= 8" },
  
  ------------------
  -- End Rotation --
  ------------------
  
  },{ 
  
  ---------------
  -- OOC Begin --
  ---------------
  
  { "Expel Harm", "player.health < 80" },
  { "Fortifying Brew", "player.health <= 30" },
  { "Touch of Karma", "player.health <= 50" },
  
  -- Keybinds
  { "Paralysis", "modifier.shift", "mouseover" },
  { "Healing Sphere", "modifier.alt", "ground" }, 
  { "Crackling Jade Lightning", "modifier.control", "target" },
  
  -- Buffs
  { "Legacy of the White Tiger", "!player.buff(Legacy of the White Tiger)" },
  { "Legacy of the Emperor", "!player.buff(Legacy of the Emperor)" },

  -------------
  -- OOC End --
  -------------
  })
