#!/usr/bin/lua
--[[!
 @package   MoonClock
 @filename  moonclock-mini.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon@openmailbox.org>
 @date      17.06.2018 01:34:35 -04
]]--

local lgi   = require('lgi')
local GLib  = lgi.require('GLib', '2.0')
local Gtk   = lgi.require('Gtk', '3.0')

local main_window = Gtk.Dialog {
   title      = "MoonClock Mini",
   resizable  = false
}

main_window:set_decorated(false)
main_window:move(900,80)

local content = Gtk.Box {
   orientation = 'VERTICAL',
   spacing = 0,
   border_width = 0,
   Gtk.Label {
      label       = os.date("%H:%M:%S"),
      id          = "moonclock",
      use_markup  = false
   }
}

main_window:get_content_area():add(content)

GLib.timeout_add_seconds(
    GLib.PRIORITY_DEFAULT, 1,
   function()
        content.child.moonclock.label = os.date("%H:%M:%S")
    return true
end
)

main_window:show_all()
Gtk.main()
