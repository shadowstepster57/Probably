-- ProbablyEngine Rotations - https://probablyengine.com/
-- Released under modified BSD, see attached LICENSE.

ProbablyEngine.locale = {
  locale = GetLocale(),
  writeTo = GetLocale(),
  locales = { },
  fallback = true,
  warn = false,
}

ProbablyEngine.locale.new = function(id)
  ProbablyEngine.locale.locales[id] = { }
  ProbablyEngine.locale.writeTo = id
end

ProbablyEngine.locale.get = function(key)
  if ProbablyEngine.locale.locales[ProbablyEngine.locale.locale]
    and ProbablyEngine.locale.locales[ProbablyEngine.locale.locale][key] then
    return ProbablyEngine.locale.locales[ProbablyEngine.locale.locale][key]
  elseif ProbablyEngine.locale.locales['enUS'][key] and ProbablyEngine.locale.fallback then
    if ProbablyEngine.locale.warn then print('Warning, local not found for key:' .. key) end
    return ProbablyEngine.locale.locales['enUS'][key]
  end
  return 'nolocal:' .. key
end

ProbablyEngine.locale.set = function(key, text)
  ProbablyEngine.locale.locales[ProbablyEngine.locale.writeTo][key] = text
end

pel = ProbablyEngine.locale
pelg = ProbablyEngine.locale.get
pels = ProbablyEngine.locale.set