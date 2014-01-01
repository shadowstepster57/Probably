-- Class ID 7 - The Naturalist
ProbablyEngine.rotation.register(7, {

  -------------------
  -- Start Racials --
  -------------------
  
  -- =^*~ Alliance ~*^= --
  -- Dwarves
  { "Stoneform", "player.health <= 65" },

  -- Draenei
  { "Gift of the Naaru", "player.health <= 70", "player" },
 
  -- <,&~ Horde ~&,> --
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
  
  -- Buffs
  { "Lightning Shield", "!player.buff(Lightning Shield)" },

  -- Survival
  { "Healing Surge", "player.health <= 75" },
  
  -- Rotation
  { "Primal Strike" },
  { "Earth Shock" },
  { "Lightning Bolt" },
  
  ------------------
  -- End Rotation --
  ------------------
  
  }
)
