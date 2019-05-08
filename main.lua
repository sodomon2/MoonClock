#!/usr/bin/lua
--[[!
 @package   minirelog de ejemplo
 @filename  init.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon@openmailbox.org>
 @date      17.06.2018 01:34:35 -04
]]--

local lgi   = require('lgi') -- requiero esta libreria que me permitira usar GTK
local GLib  = lgi.GLib -- para el treeview
local Gtk   = lgi.require('Gtk', '3.0') -- el objeto GTK


local main_window = Gtk.Dialog {
   title      = "Diego Clock",
   resizable  = false
}

main_window:set_decorated(false)
main_window:move(900,80)
--print(main_window:get_position())

local content = Gtk.Box {
   orientation = 'VERTICAL',
   spacing = 0,
   border_width = 0,
   Gtk.Label {
      label       = os.date("%H:%M:%S"),
      id          = "relog",
      use_markup  = false
   }
}

main_window:get_content_area():add(content)

--el relog
GLib.timeout_add_seconds(
    GLib.PRIORITY_DEFAULT, 1,
   function()
        content.child.relog.label = os.date("%H:%M:%S")
    return true
end
)

--print(content.child.relog:get_attributes())

-- inicio la ventana y muestro todo
main_window:show_all()
Gtk.main()
