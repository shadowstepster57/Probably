-- SPEC ID 105 (Restoration)
ProbablyEngine.rotation.register(105, {

  -- Racials (Temp)
  -- Night Elves
  { "Shadowmeld", "target.threat >= 80" },
  { "Shadowmeld", "focus.threat >= 80"}, 

  --Screw bear form
  { "/cancelform", "player.buff(Bear Form)" },
  
  -- Keybinding
  { "Wild Mushroom: Bloom", "modifier.control" }, 
  { "Genesis", { "modifier.shift", "!modifier.last(Genesis)" }},
  { "Stampeding Roar", "modifier.alt" },
  
  -- Mouseover
  { "Rebirth", { "mouseover.dead", "mouseover.range <= 40" }, "mouseover" },
  { "Rejuvenation", { "mouseover.health <= 85", "!mouseover.buff(Rejuvenation)", "!mouseover.dead", "mouseover.range <= 40" }, "mouseover" },
  
  -- Survival on Self
  { "Renewal", "player.health <= 30" },
  { "Might of Ursoc", "player.health <= 50" },
  { "Cenarion Ward", { "player.health <= 75" }, "player" },
  { "Barkskin", { "player.health <= 80" }, "player" },
  { "Innervate", { "player.mana <= 75" }, "player" },

  -- On tank
  { "Regrowth", { "tank.health <= 65", "!tank.buff(Regrowth)", "!modifier.last(Regrowth)", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Ironbark", { "tank.health <= 75", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Lifebloom", { "tank.buff(Lifebloom).count < 3", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Lifebloom", { "tank.buff(Lifebloom).duration < 3", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Rejuvenation", { "tank.health < 100", "!tank.buff(Rejuvenation)", "!tank.dead", "tank.range <= 40" }, "tank" },
  
  -- Regular Healing
  --{ "Nature's Cure", "@coreHealing.needsDispelled()" },
  { "Regrowth", { "lowest.health <= 65", "lowest.range <= 40", "!lowest.buff(Regrowth)", "!modifier.last(Regrowth)", "!lowest.dead" }, "lowest" },
  { "Healing Touch", { "lowest.health <= 65", "lowest.range <= 40", "!lowest.dead" }, "lowest" },
  { "Rejuvenation", { "lowest.health <= 85", "!lowest.buff(Rejuvenation)", "lowest.range <= 40", "!lowest.dead" }, "lowest" },
  { "Wild Growth", { "@coreHealing.needsHealing(75, 5)", "lowest.range <= 40", "!lowest.dead" }, "lowest" },
  { "Swiftmend", { "lowest.health <= 80", "lowest.buff(Rejuvenation)", "lowest.range <= 40", "!lowest.dead" }, "lowest" },
  { "Swiftmend", { "lowest.health <= 80", "lowest.buff(Regrowth)", "lowest.range <= 40" }, "lowest" },
  
  -- Treants, you persistent fucks.
  { "102693", { "@coreHealing.needsHealing(70, 3)", "!modifier.last(106737)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },

  -- Nature's Swiftness / Sage Mender Healing
  { "Nature's Swiftness", { "tank.health <= 40", "player.buff(Sage Mender).count < 5" }},
  { "Healing Touch", { "player.buff(Nature's Swiftness)", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Healing Touch", { "player.buff(Sage Mender).count = 5", "!tank.dead", "tank.range <= 40" }, "tank" },
  
  -- Basic Buffing
  { "Mark of the Wild", { "!lowest.buff(Mark of the Wild).any", "!lowest.buff(Blessing of Kings).any", "!lowest.buff(Legacy of the Emperor).any", "!lowest.dead", "lowest.range <= 30" }, "lowest" },
  { "Treant Form", "player.form = 0" },
  
  -- Oh Shit Healing Start
  { "Incarnation: Tree of Life", { "@coreHealing.needsHealing(60,4)", "!player.buff(Incarnation: Tree of Life)", "modifier.cooldowns" }},
  
  -- Incarnation: Turret of Healing
  { "Wild Growth", { "player.buff(Incarnation: Tree of Life)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Regrowth", { "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(60, 4)", "lowest.health <= 60", "!lowest.buff(Regrowth)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Tranquility", { "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(55, 4)", "lowest.range <= 40" }},
  
  -- Because Fuck Wild Mushrooms
  { "Wild Mushroom", { "!player.spell(Wild Mushroom).casted = 1", "!modifier.last(Wild Mushroom)", "!tank.dead", "tank.range <= 40" }, "tank" },
  
  -- Because Healing is not enough?
  { "Genesis", { "lowest.health <= 70", "!player.spell(Genesis).casted = 1", "lowest.buff(Rejuvenation)", "lowest.buff(Regrowth)", "lowest.buff(Wild Growth)", "!lowest.dead", "lowest.range <= 40" }},
  
}, 
{
  -- Out of Combat
  -- Keybinds
  {{
  { "Travel Form", "modifier.control" },
  { "Genesis", { "modifier.shift", "!modifier.last(Genesis)" }},
  { "Stampeding Roar", "modifier.alt" },

  -- On tank
  { "Lifebloom", { "tank.buff(Lifebloom).count < 3", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Lifebloom", { "tank.buff(Lifebloom).duration < 3", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Rejuvenation", { "!tank.buff(Rejuvenation)", "tank.health <= 85", "!tank.dead", "tank.range <= 40" }, "tank" },
  { "Regrowth", { "tank.health <= 65", "!tank.buff(Regrowth)", "!modifier.last(Regrowth)", "!tank.dead", "tank.range <= 40" }, "tank" },
  
  -- Basic Buffing
  { "Mark of the Wild", { "!lowest.buff(Mark of the Wild).any", "!lowest.buff(Blessing of Kings).any", "!lowest.buff(Legacy of the Emperor).any", "!lowest.dead", "lowest.range <= 30" }, "lowest" },
  { "Treant Form", "player.form = 0" },
   
  -- Regular Healing
  --{ "Nature's Cure", "@coreHealing.needsDispelled()" },
  { "Rejuvenation", { "lowest.health <= 85", "!lowest.buff(Rejuvenation)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Regrowth", { "lowest.health <= 65", "!lowest.buff(Regrowth)", "!lowest.dead", "!modifier.last(Regrowth)", "lowest.range <= 40" }, "lowest" },
  { "Healing Touch", { "lowest.health <= 65", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Wild Growth", { "@coreHealing.needsHealing(75, 5)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Swiftmend", { "lowest.health <= 80", "lowest.buff(Rejuvenation)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  { "Swiftmend", { "lowest.health <= 80", "lowest.buff(Regrowth)", "!lowest.dead", "lowest.range <= 40" }, "lowest" },
  }, { "!player.buff(Bear Form)", "!player.buff(Cat Form)", "!player.buff(Flight Form)", "!player.buff(Swift Flight Form)", "!player.buff(Travel Form)", "!player.buff(Aquatic Form)" }}
})
