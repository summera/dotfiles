local as = require("hs.applescript")
local geometry = require("hs.geometry")

--== Global Configuration ==--
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.grid.GRIDWIDTH  = 1
hs.grid.GRIDHEIGHT = 1

hs.window.animationDuration = 0

--== Applications ==--
local function launchOrFocus(app)
  return hs.application.launchOrFocus(app)
end

k = hs.hotkey.modal.new({"ctrl"}, "space")

k:bind({}, "t", function() launchOrFocus("iTerm") end, function() k:exit() end)
k:bind({}, "s", function() launchOrFocus("Slack") end, function() k:exit() end)
k:bind({}, "y", function() launchOrFocus("Spotify") end, function() k:exit() end)
k:bind({}, "m", function() launchOrFocus("Messages") end, function() k:exit() end)
k:bind({}, "c", function() launchOrFocus("Google Chrome") end, function() k:exit() end)
k:bind({}, "m", function() launchOrFocus("Messages") end, function() k:exit() end)
k:bind({}, "d", function() launchOrFocus("Todoist") end, function() k:exit() end)

k:bind({}, "r", function() hs.reload() end, function() k:exit() end)
k:bind({}, "x", function() hs.window.focusedWindow():close() end, function() k:exit() end)

--== Grid snapping ==--
local function snapFocusedWindow(layout)
  hs.window.focusedWindow():moveToUnit(layout)
end


k:bind({}, "h", function() snapFocusedWindow(hs.layout.left25) end, function() k:exit() end)
k:bind({}, "j", function() snapFocusedWindow(hs.layout.left50) end, function() k:exit() end)
k:bind({}, "k", function() snapFocusedWindow(geometry.rect(0.25, 0, 0.5, 1)) end, function() k:exit() end)
k:bind({}, "l", function() snapFocusedWindow(hs.layout.right50) end, function() k:exit() end)
k:bind({}, ";", function() snapFocusedWindow(hs.layout.right25) end, function() k:exit() end)

k:bind({}, "i", function() snapFocusedWindow(geometry.rect(0.125, 0, 0.75, 1)) end, function() k:exit() end)
k:bind({}, "o", function() snapFocusedWindow(hs.layout.maximized) end, function() k:exit() end)

--== Welcome ==--
hs.alert.show("Hammerspoon, at your service.")
