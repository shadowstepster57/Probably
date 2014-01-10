-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local GetActionInfo = GetActionInfo
local GetSpellCooldown = GetSpellCooldown
local GetSpellInfo = GetSpellInfo
local IsUsableSpell = IsUsableSpell
local hooksecurefunc = hooksecurefunc

local config = ProbablyEngine.config
local queue = ProbablyEngine.module.queue
local player = ProbablyEngine.module.player

ProbablyEngine.module.register("queue", {
  queue = nil,
  macro_queue = nil
})

ProbablyEngine.module.queue.add_spell = function(spell_name)
  if spell_name and ProbablyEngine.module.queue.queue ~= spell_name then
    ProbablyEngine.module.queue.queue = spell_name
    ProbablyEngine.debug.print(spell_name .. " was queued for casting.", 'queue')
  end
end

ProbablyEngine.module.queue.add_macro = function(macro_id)
  if ProbablyEngine.module.queue.macro_queue ~= macro_id then
    ProbablyEngine.module.queue.macro_queue = macro_id
    ProbablyEngine.debug.print("Macro ID " .. macro_id .. " was queued for casting.", 'queue')
  end
end

-- This hooks the secure function "UseAction" that is called when we press a button on our
-- action bars.  This allows us to let the engine know we would like to cast a spell other
-- than the one currently active in the rotation.

local function useAction(slot, target, button)
  if not player.combat
     or not config.read('button_states', 'MasterToggle', false)
     or not button then
    print('Returning Early')
    return false
  end

  local actionType, actionID = GetActionInfo(slot)
  if actionType == 'spell' then
    local spell = GetSpellName(actionID)
    local isUsable, notEnoughMana = IsUsableSpell(spell)
    if not isUsable or notEnoughMana or select(2, GetSpellCooldown(spell)) - select(2, GetSpellCooldown(61304)) > 0 then
      return false
    end
    queue.add_spell(spell)
  end
end
hooksecurefunc('UseAction', useAction)
