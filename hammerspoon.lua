-- Hammerspoon config

local application = require "hs.application"
local grid = require "hs.grid"
local hotkey = require "hs.hotkey"
local window = require "hs.window"

-- disable animation
window.animationDuration = 0

-- hotkeys
local mod1 = {"shift", "alt"}
local mash = {"ctrl", "alt", "cmd"}

-- apps
appShortcuts = {
  dash = 'Dash',
  chrome = 'Google Chrome',
  slack = 'Slack'
}


hotkey.bind(mod1, "H", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(mod1, "L", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(mod1, "U", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hotkey.bind(mod1, "K", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hotkey.bind(mod1, "J", function()
  local win = window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

--
-- Open Applications
--
local function openchrome()
  application.launchOrFocus("Google Chrome")
end

local function openslack()
  application.launchOrFocus("Slack")
end

local function openiterm()
  application.launchOrFocus("iTerm 2")
end

hotkey.bind(mod1, 'C', openchrome)
hotkey.bind(mod1, 'S', openslack)
hotkey.bind(mod1, 'T', openiterm)

hotkey.bind(mash, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
