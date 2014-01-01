-- Class ID 11 - Drood
ProbablyEngine.rotation.register(11, {
  
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
  
  -- Moving
  { "Moonfire", "!target.debuff(Moonfire).duration < 3", "player.moving", "!toggle.cat" },
  
  -- Caster Rotation
  { "Rejuvenation", "player.health <= 65" },
  { "Moonfire", "!target.debuff(Moonfire).duration < 3", "!toggle.cat" },
  { "Wrath", "!toggle.cat" },
  
  -- Kitty Rotation
  { "Prowl", "target.enemy", "toggle.cat" },
  { "Rake", "target.debuff(Rake).duration <= 3", "toggle.cat" },
  { "Mangle", "toggle.cat" },
  
  ,}
  
  function ()
  ProbablyEngine.toggle.create('cat', 'Interface\\Icons\\ability_druid_predatoryinstincts', 'Kitty Mode - Requires Level 6', '')
  )
