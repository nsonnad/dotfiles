require "utils"
require "pomodoor"
require "keyboard.windows"

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

-- Open Applications with appMod+key
appShortcuts = {
  ['1'] = 'Firefox',
  ['2'] = 'Notion',
  ['3'] = 'Slack',
  ['4'] = 'Reeder'
}

for key, value in pairs(appShortcuts) do
  hotkey.bind(appFocus, key, bindAppFocus(value))
  hotkey.bind(appLaunch, key, bindAppLaunch(value))
end

-- layouts
local fullScreenLayout = {
  { "Firefox", nil, nil, hs.layout.maximized, nil, nil },
  { "iTerm", nil, nil, hs.layout.maximized, nil, nil }
}

local browserTermLayout = {
  { "Firefox", nil, nil, hs.layout.right50, nil, nil },
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

hs.loadSpoon('ControlEscape'):start() -- Load Hammerspoon bits from https://github.com/jasonrudolph/ControlEscape.spoon
