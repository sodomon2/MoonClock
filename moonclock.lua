#!/usr/bin/lua
--[[!
 @package   MoonClock
 @filename  moonclock.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      29.04.2020 01:34:35 -04
]]--

local lgi         = require('lgi')
local GObject     = lgi.require('GObject', '2.0')
local GLib        = lgi.require('GLib', '2.0')
local Gtk         = lgi.require('Gtk', '3.0')

local builder     = Gtk.Builder()
local ui          = builder.objects
builder:add_from_file('moonclock.ui')
ui.main_window:move(850,80)

ui.clock.label     = os.date("%H:%M:%S")
GLib.timeout_add_seconds(
    GLib.PRIORITY_DEFAULT, 1,
   function()
        ui.clock.label = os.date("%H:%M:%S")
    return true
end
)

ui.main_window:show_all()
Gtk.main()