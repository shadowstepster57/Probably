-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

local debug = ProbablyEngine.debug

ProbablyEngine.listener = {}
local listener = ProbablyEngine.listener

local listeners = {}

local function onEvent(self, event, ...)
  if not listeners[event] then return end
  debug.print('Event Called: ' .. event, 'listener')

  for i = 1, #listeners[event] do
    listeners[event][i](...)
  end
end

local frame = CreateFrame('Frame', 'PE_Events')
frame:SetScript('OnEvent', onEvent)

function listener.register(event, callback)
  debug.print('Event Registered: ' .. event, 'listener')

  if not listeners[event] then
    frame:RegisterEvent(event)
    listeners[event] = {}
  end

  table.insert(listeners[event], callback)
end

function listener.unregister(event, callback)
  debug.print('Event Unregistered: ' .. event, 'listener')

  for i = 1, #listeners[event] do
    if listeners[event][i] == callback then
      table.remove(listeners[event], i)
    end
  end

  if #listeners[event] == 0 then
    listeners[event] = nil
    frame:UnregisterEvent(event)
  end
end

function listener.trigger(event, ...)
  onEvent(nil, event, ...)
end
