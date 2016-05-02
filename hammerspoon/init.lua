require "utils"
require "pomodoor"

-- Hammerspoon config

local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local window = require "hs.window"

-- disable animation
window.animationDuration = 0

-- hotkeys
local mod1 = {"shift", "alt"}
local mod2 = {"ctrl", "alt"}
local mod3 = {"ctrl", "cmd"}
local mash = {"ctrl", "alt", "cmd"}
local appFocus = "alt"
local appLaunch = mod1

-- Lock to screen edge
hotkey.bind(mod1, "K", function() push(0, 0, 1, 0.5) end)
hotkey.bind(mod1, "J", function() push(0, 0.5, 1, 0.5) end)
hotkey.bind(mod1, "H", function() push(0, 0, 0.5, 1) end)
hotkey.bind(mod1, "L", function() push(0.5, 0, 0.5, 1) end)
hotkey.bind(mod1, "U", function() push(0, 0, 1, 1) end)

-- Resize hotkeys
hs.hotkey.bind(mod2, "K", function() yank(0,-100) end) -- yank bottom up
hs.hotkey.bind(mod2, "J", function() yank(0,100) end) -- yank bottom down
hs.hotkey.bind(mod2, "H", function() yank(-100,0) end) -- yank right side left
hs.hotkey.bind(mod2, "L", function() yank(100,0) end) -- yank right side right

-- Movement hotkeys
hs.hotkey.bind(mod3, "K", function() nudge(0,-100) end)	--up
hs.hotkey.bind(mod3, 'J', function() nudge(0,100) end) 	--down
hs.hotkey.bind(mod3, "H", function() nudge(-100,0) end)	--left
hs.hotkey.bind(mod3, "L", function() nudge(100,0) end)	--right

-- Open Applications with appMod+key
appShortcuts = {
  ['1'] = 'Google Chrome',
  ['2'] = 'Reeder',
  ['3'] = 'Slack',
  ['4'] = 'Dash',
  ['5'] = 'Atom'
}

for key, value in pairs(appShortcuts) do
  hotkey.bind(appFocus, key, bindAppFocus(value))
  hotkey.bind(appLaunch, key, bindAppLaunch(value))
end

-- layouts
local fullScreenLayout = {
  { "Google Chrome", nil, nil, hs.layout.maximized, nil, nil },
  { "iTerm", nil, nil, hs.layout.maximized, nil, nil }
}

local browserTermLayout = {
  { "Google Chrome", nil, nil, hs.layout.right50, nil, nil },
  { "iTerm", nil, nil, hs.layout.left50, nil, nil }
}

hotkey.bind(mash, "1", function()
  local iterm = hs.application.get("iTerm")
  iterm:selectMenuItem({"View", "Toggle Full Screen"})
  hs.layout.apply(fullScreenLayout)
end)

hotkey.bind(mash, "2", function()
  local iterm = hs.application.get("iTerm")
  iterm:selectMenuItem({"View", "Toggle Full Screen"})
  hs.layout.apply(browserTermLayout)
end)

local expose_space = hs.expose.new(nil,{includeOtherSpaces=false})
hs.hotkey.bind(mod2,'e','App Expose',function()expose_space:toggleShow()end)

-- pomodoro key binding
hs.hotkey.bind(mash, 'P', function() pom_enable() end)
hs.hotkey.bind(mash, '[', function() pom_disable() end)
hs.hotkey.bind(mash, ']', function() pom_reset_work() end)

hotkey.bind(mash, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

