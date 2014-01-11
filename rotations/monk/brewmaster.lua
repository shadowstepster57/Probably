-- SPEC ID 268 Brewmaster
ProbablyEngine.rotation.register(268, {

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
  
  -- Threat Control
  { "Provoke", "mouseover.threat < 100", "mouseover" },
  
  -- Survival
  { "Expel Harm", "player.health < 95" },
  { "Fortifying Brew", "player.health <= 50" },
  { "Nimble Brew", "player.state.fear" },
  { "Nimble Brew", "player.state.stun" },
  { "Nimble Brew", "player.state.root" },
  { "Nimble Brew", "player.state.horror" },
  { "Dampen Harm", "player.health <= 60" },
  { "Diffuse Magic", "player.health <= 60" },
  
  -- Multitarget
  { "Rushing Jade Wind", { "modifier.multitarget", "!player.buff(Rushing Jade Wind)", "!player.buff(Rushing Jade Wind).duration < 2" } },
  { "Spinning Crane Kick", "modifier.multitarget" },
  
  -- Ground Stuff
  { "Dizzying Haze", "modifier.shift", "ground" },
  { "Summon Black Ox Statue", "modifier.control", "ground" },
  { "Healing Sphere", "modifer.alt", "ground" },

  -- Interrupts
  { "Spear Hand Strike", "modifier.interrupts" },
  { "Grapple Weapon", "modifier.interrupts" },
  { "Leg Sweep", "modifier.interrupts", "target.range <= 10" },
  
  -- PvP
  { "Disable", { "toggle.disable", "!target.debuff(Disable)" } },

  -- Talents
  { "Chi Wave" },
  { "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
  { "Chi Burst" },
  { "Invoke Xuen, the White Tiger" },
  { "Tiger's Lust", "target.range >= 15" },

  -- Brews
  { "Purifying Brew", "player.debuff(Moderate Stagger)" },
  { "Purifying Brew", "player.debuff(Heavy Stagger)" },
  { "Elusive Brew", "player.buff(Elusive Brew).count >= 10" },

  -- Rotation
  { "Keg Smash" },
  { "Guard", "player.buff(Power Guard)" },
  { "Breath of Fire", { "target.debuff(Dizzying Haze)", "!target.debuff(Breath of Fire)"} },
  { "Tiger Palm", "player.buff(Tiger Power).duration < 4" },
  { "Blackout Kick" },
  { "Jab" },
  { "Tiger Palm" },

  ------------------
  -- End Rotation --
  ------------------
  
  },{
  
  ---------------
  -- OOC Begin --
  ---------------
  
  -- Buffs
  { "Legacy of the Emperor", "!player.buff(Legacy of the Emperor)" },
  
  -- Ground Stuff
  { "Dizzying Haze", "modifier.shift", "ground" },
  { "Summon Black Ox Statue", "modifier.control", "ground" },
  { "Healing Sphere", "modifier.alt", "ground" },
  
  -------------
  -- OOC End --
  -------------
}, function()
ProbablyEngine.toggle.create('disable', 'Interface\\Icons\\spell_nature_rejuvenation', 'Disable', 'Toggle Disable')
end)