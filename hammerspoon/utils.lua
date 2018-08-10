-- Utility / helper functions for Hammerspoon
---------------------------------------------

-- only launch app, do nothing if already running
function bindAppLaunch(appName)
  return function()
    if not hs.application.get(appName) then
      hs.application.launchOrFocus(appName)
    end
  end
end

-- only focus app, do nothing if not running
function bindAppFocus(appName)
  return function()
    app = hs.application.get(appName)
    if app then
      if app:isFrontmost()
      then
        app:hide()
      else
        hs.application.launchOrFocus(appName)
      end
    end
  end
end

-- hide app, do nothing if not running
function bindAppHide(appName)
  return function()
    if hs.application.get(appName) then
      hs.application.hide(appName)
    end
  end
end

-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
function push(x, y, w, h)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	f.x = max.x + (max.w*x)
	f.y = max.y + (max.h*y)
	f.w = max.w*w
	f.h = max.h*h
	win:setFrame(f)
end

-- Resize a window by moving the bottom
function yank(xpixels,ypixels)
	local win = hs.window.focusedWindow()
	local f = win:frame()

	f.w = f.w + xpixels
	f.h = f.h + ypixels
	win:setFrame(f)
end

-- Move a window a number of pixels in x and y
function nudge(xpos, ypos)
	local win = hs.window.focusedWindow()
	local f = win:frame()
	f.x = f.x + xpos
	f.y = f.y + ypos
	win:setFrame(f)
end
