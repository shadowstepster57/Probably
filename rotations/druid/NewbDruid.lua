-- Class ID 11 - Drood
ProbablyEngine.rotation.register(11, {
  
    -- Racials (Temp)
  
  -- =^*~ Alliance ~*^= --
  -- Night Elves
  { "Shadowmeld", "target.threat >= 80" },
  { "Shadowmeld", "focus.threat >= 80"},
  
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
