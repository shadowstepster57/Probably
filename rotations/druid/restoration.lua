-- SPEC ID 105 (Restoration)

ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for _, unit in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit.unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit.unit
        return true
      end
    end
  end,
})


ProbablyEngine.rotation.register(105, {

  -- Keybinding
  { "Wild Mushroom: Bloom", "modifier.control" }, 
  { "Genesis", "modifier.shift" },
  { "Stampeding Roar", "modifier.alt" },
  
  -- Mouseover
  { "Rebirth", "!mouseover.alive", "mouseover" },
  { "Rejuvenation", "mouseover.health <= 85", "mouseover" },
  
  -- Basic Buffing
  { "Mark of the Wild", "!player.buff(Mark of the Wild)", "player" },
  { "Treant Form", 
   { "!player.buff(Cat Form)", 
     "!player.buff(Bear Form)", 
	 "!player.buff(Travel Form)", 
	 "!player.buff(Aquatic Form)", 
	 "!player.buff(Flight Form)", 
	 "!player.buff(Swift Flight Form)", 
   }, "player" },
  
  -- Survival on Self
  { "Renewal", "player.health <= 30" },
  { "Cenarion Ward", "player.health <75", "player" },
  { "Barkskin", "player.health <= 80", "player" },
  { "Innervate", "player.mana <= 75", "player" },
  { "Might of Ursoc", "player.health <= 50" },
  { "/cancelaura Bear Form", "player.buff(Might of Ursoc" },

  -- On Tank
  { "Lifebloom", {"focus.buff(Lifebloom) <= 3", "tank.buff(Lifebloom).count <= 2"}, "focus" },
  { "Rejuvenation", "tank.health <= 99", "tank" },
  { "Regrowth", "tank.health <= 65", "tank" },
  { "Ironbark", "tank.health <= 75", "tank" },
  
  -- Regular Healing
  { "Nature's Cure", "@coreHealing.needsDispelled"
  { "Rejuvenation", "lowest.health <= 85", "lowest" },
  { "Healing Touch", "lowest.health <= 65", "lowest" },
  { "Wild Growth", "@coreHealing.needsHealing(75, 5)", "lowest" },
  { "Regrowth", "lowest.health <= 50", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Rejuvenation)", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Regrowth)", "lowest" },
  
  -- Treants, you persistent fucks.
  { "102693", 
   { "@coreHealing.needsHealing(70, 3)", 
    "!modifier.last(106737)"
   },"lowest" },

  -- Nature's Swiftness Healing
  { "Nature's Swiftness", "tank.health <= 40" },
  { "Healing Touch", "player.buff(Nature's Swiftness)", "tank" },
  
  -- Oh Shit Healing Start
  { "Incarnation: Tree of Life", "@coreHealing.needsHealing(60,4)" },
  
  --Incarnation: Turret of Healing
  { "Wild Growth", "player.buff(Incarnation: Tree of Life)", "lowest" },
  { "Regrowth", { "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(60, 4)", "lowest.health <= 60"}, "lowest" },
  { "Tranquility", "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(55, 4)" },
  
  -- Because Fuck Wild Mushrooms
  { "Wild Mushroom", "tank" },
  }, 
  {
  
  -- Out of Combat
  
  -- Keybinds
  { "Travel Form", "modifier.control" }, 
  { "Genesis", "modifier.shift" },
  { "Stampeding Roar", "modifier.alt" },
  -- On Tank
  { "Lifebloom", {"focus.buff(Lifebloom) <= 3", "tank.buff(Lifebloom).count <= 2"}, "focus" },
  { "Rejuvenation", "tank.health <= 99", "tank" },
  { "Regrowth", "tank.health <= 65", "tank" },
  
  -- Basic Buffing
  { "Mark of the Wild", "!player.buff(Mark of the Wild)", "player" },
  { "Treant Form", 
   { "!player.buff(Cat Form)", 
     "!player.buff(Bear Form)", 
	 "!player.buff(Travel Form)", 
	 "!player.buff(Aquatic Form)", 
	 "!player.buff(Flight Form)", 
	 "!player.buff(Swift Flight Form)", 
   }, "player" },
   
  -- Regular Healing
  { "Nature's Cure", "@coreHealing.needsDispelled"
  { "Rejuvenation", "lowest.health <= 85", "lowest" },
  { "Healing Touch", "lowest.health <= 65", "lowest" },
  { "Wild Growth", "@coreHealing.needsHealing(75, 5)", "lowest" },
  { "Regrowth", "lowest.health <= 50", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Rejuvenation)", "lowest" },
  { "Swiftmend", "lowest.health <= 80", "lowest.buff(Regrowth)", "lowest" },
   
  }
)
