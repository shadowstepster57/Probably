-- SPEC ID 105 (Restoration)
ProbablyEngine.rotation.register(105, {

  --Screw bear form
  { "/cancelform", "player.buff(Bear Form)" },
  
  -- Keybinding
  { "Wild Mushroom: Bloom", "modifier.control" }, 
  { "Genesis", "modifier.shift", "!modifier.last(Genesis)" },
  { "Stampeding Roar", "modifier.alt" },
  
  -- Mouseover
  { "Rebirth", "mouseover.dead", "mouseover" },
  { "Rejuvenation", "mouseover.health <= 85", "mouseover" },
  
  -- Basic Buffing
  { "Mark of the Wild", { "!player.buff(Mark of the Wild).any", "!player.buff(Blessing of Kings).any", "!player.buff(Legacy of the Emperor).any" }},
  { "Treant Form", "player.form = 0" },
  
  -- Survival on Self
  { "Renewal", "player.health <= 30" },
  { "Might of Ursoc", "player.health <= 50" },
  { "Cenarion Ward", "player.health < 75", "player" },
  { "Barkskin", "player.health <= 80", "player" },
  { "Innervate", "player.mana <= 75", "player" },

  -- On Tank
  { "Regrowth", { "tank.health <= 65", "tank.buff(Regrowth)", }, "tank" },
  { "Ironbark", "tank.health <= 75", "tank" },
  { "Lifebloom", { "tank.buff(Lifebloom) <= 3", "tank.buff(Lifebloom).count <= 2" }, "tank" },
  { "Rejuvenation", "tank.health <= 99", "tank" },
  
  -- Regular Healing
  --{ "Nature's Cure", "@coreHealing.needsDispelled()" },
  { "Regrowth", { "lowest.health <= 50", "!lowest.buff(Regrowth)" }, "lowest" },
  { "Healing Touch", "lowest.health <= 65", "lowest" },
  { "Rejuvenation", "lowest.health <= 85", "lowest" },
  { "Wild Growth", "@coreHealing.needsHealing(75, 5)", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Rejuvenation)", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Regrowth)", "lowest" },
  
  -- Treants, you persistent fucks.
  { "102693", { "@coreHealing.needsHealing(70, 3)", "!modifier.last(106737)" }, "lowest" },

  -- Nature's Swiftness Healing
  { "Nature's Swiftness", "tank.health <= 40" },
  { "Healing Touch", "player.buff(Nature's Swiftness)", "tank" },
  
  -- Oh Shit Healing Start
  { "Incarnation: Tree of Life", "@coreHealing.needsHealing(60,4)" },
  
  --Incarnation: Turret of Healing
  { "Wild Growth", "player.buff(Incarnation: Tree of Life)", "lowest" },
  { "Regrowth", { "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(60, 4)", "lowest.health <= 60" }, "lowest" },
  { "Tranquility", "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(55, 4)" },
  
  -- Because Fuck Wild Mushrooms
  { "Wild Mushroom", "!tank.dead", "ground" },
}, 
{
  -- Out of Combat
  
  -- Keybinds
  { "Travel Form", "modifier.control" }, 
  { "Genesis", "modifier.shift", "!modifier.last(Genesis)" },
  { "Stampeding Roar", "modifier.alt" },

  -- On Tank
  { "Lifebloom", { "tank.buff(Lifebloom) <= 3", "tank.buff(Lifebloom).count <= 2" }, "tank" },
  { "Rejuvenation", "tank.health <= 99", "tank" },
  { "Regrowth", "tank.health <= 65", "tank" },
  
  -- Basic Buffing
  { "Mark of the Wild", { "!player.buff(Mark of the Wild).any", "!player.buff(Blessing of Kings).any", "!player.buff(Legacy of the Emperor).any" }},
  { "Treant Form", "player.form = 0" },
   
  -- Regular Healing
  --{ "Nature's Cure", "@coreHealing.needsDispelled()" },
  { "Rejuvenation", "lowest.health <= 85", "lowest" },
  { "Healing Touch", "lowest.health <= 65", "lowest" },
  { "Wild Growth", "@coreHealing.needsHealing(75, 5)", "lowest" },
  { "Regrowth", "lowest.health <= 50", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Rejuvenation)", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Regrowth)", "lowest" },
})
