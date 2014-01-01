-- Class ID 2 - Paladins Are Sad
ProbablyEngine.rotation.register(2, {

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

  -----------------
  -- End Racials --
  -----------------
  
  --------------------
  -- Start Rotation --
  --------------------
  
  -- Keybind
  { "Hammer of Justice", "modifier.shift" },
  
  -- 'Rotation'
  { "Word of Glory", "player.health < 90" },
  { "Judgement" },
  { "Crusader Strike" },
  
  ------------------
  -- End Rotation --
  ------------------
  
  }
)
