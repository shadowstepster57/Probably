-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local GetSpellInfo = GetSpellInfo

ProbablyEngine.cycleTime = ProbablyEngine.cycleTime or 50

ProbablyEngine.cycle = function(skip_verify)

  local turbo = ProbablyEngine.config.read('pe_turbo', false)
  local cycle =
    IsMounted() ~= 1
    and UnitInVehicle("player") ~= 1
    and ProbablyEngine.module.player.combat
    and ProbablyEngine.toggle.states.MasterToggle
    and ProbablyEngine.module.player.specId

  if cycle or skip_verify then
    local stickyValue = GetCVar("deselectOnClick")
    local spell, target = false


    local queue = ProbablyEngine.module.queue.queue
    if queue ~= nil and ProbablyEngine.parser.can_cast(queue) then
      spell = queue
      target = 'target'
      ProbablyEngine.module.queue.queue = nil
    elseif ProbablyEngine.parser.lastCast == queue then
      ProbablyEngine.module.queue.queue = nil
    else
      spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeRotation)
    end

    if not spell then
      spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeRotation)
    end

    if spell then

      local name, _, icon, _, _, _, _, _, _ = GetSpellInfo(spell)

      if target ~= "ground" then
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on ( " .. UnitName((target or 'target')) .. " )", 'spell_cast')
      else
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on the ground!", 'spell_cast')
      end

      ProbablyEngine.buttons.icon('MasterToggle', icon)

      if target == "ground" then
        SetCVar("deselectOnClick", "0")
        CameraOrSelectOrMoveStart(1) -- this is unlocked
        CastSpellByName(GetSpellName(name))
        CameraOrSelectOrMoveStop(1) -- this isn't unlocked
        SetCVar("deselectOnClick", "1")
        if icon then
          ProbablyEngine.actionLog.insert('Ground Cast', GetSpellName(name), icon)
        end
      else
        CastSpellByName(GetSpellName(name), target or "target")
        if icon then
          ProbablyEngine.actionLog.insert('Spell Cast', GetSpellName(name), icon)
        end
      end

    end
    SetCVar("deselectOnClick", stickyValue)
  end
end

ProbablyEngine.timer.register("rotation", function()
    ProbablyEngine.cycle()
end, ProbablyEngine.cycleTime)

ProbablyEngine.timer.register("oocrotation", function()
  local cycle =
    IsMounted() ~= 1
    and UnitInVehicle("player") ~= 1
    and ProbablyEngine.module.player.combat ~= true
    and ProbablyEngine.toggle.states.MasterToggle
    and ProbablyEngine.module.player.specId ~= 0
    and ProbablyEngine.rotation.activeOOCRotation ~= false

  if cycle then
    local stickyValue = GetCVar("deselectOnClick")
    local spell, target = ''
    spell, target = ProbablyEngine.parser.table(ProbablyEngine.rotation.activeOOCRotation, 'player')

    if target == nil then target = 'player' end
    if spell then
      local _, spellID = GetSpellBookItemInfo(GetSpellBookIndex(spell))
      local name, _, icon, _, _, _, _, _, _ = GetSpellInfo(spellID)

      if target ~= "ground" then
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on ( " .. UnitName((target or 'target')) .. " )", 'spell_cast')
      else
        ProbablyEngine.debug.print("Casting |T"..icon..":10:10|t ".. name .. " on the ground!", 'spell_cast')
      end

      ProbablyEngine.buttons.icon('MasterToggle', icon)

      if target == "ground" then
        SetCVar("deselectOnClick", "0")
        CameraOrSelectOrMoveStart(1) -- this is unlocked
        CastSpellByID(spellID)
        CameraOrSelectOrMoveStop(1) -- this isn't unlocked
        SetCVar("deselectOnClick", "1")
        if icon then
          ProbablyEngine.actionLog.insert('Ground Cast', GetSpellName(name), icon)
        end
      else
        CastSpellByID(spellID, target)
        if icon then
          ProbablyEngine.actionLog.insert('Spell Cast', GetSpellName(name), icon)
        end
      end
    end
    SetCVar("deselectOnClick", stickyValue)
  end
end, ProbablyEngine.cycleTime)
