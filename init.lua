#!/usr/bin/lua
--[[!
 @package   Relog
 @filename  init.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon@openmailbox.org>
 @date      17.06.2018 01:34:35 -04
]]--

-- declaro mis variables globales

require('lib.middleclass') -- la libreria middleclass me da soporte a OOP

local lgi = require('lgi') -- requiero esta libreria que me permitira usar GTK

local GObject = lgi.GObject -- parte de lgi
local GLib = lgi.GLib -- para el treeview
local Gtk = lgi.require('Gtk', '3.0') -- el objeto GTK

local assert = lgi.assert
local builder = Gtk.Builder()

assert(builder:add_from_file('vistas/Relog.ui'),"error al cargar el archivo") -- hago un debugger, si este archivo existe (true) enlaso el archivo ejemplo.ui, si no existe (false) imprimo un error
local ui = builder.objects

-- declaro los objetos

local main_window = ui.main_window -- invoco la ventana con el id main_window
local hora = builder:get_object("hora")   -- invoco al label con el id hora
main_window:move(850,80)  --posiciona la ventana x(800),y(80)

-- cierro la ventana cuando se presione boton cerrar (x)
function main_window:on_destroy()
  Gtk.main_quit()
end

-- Hago un bucle que cuente los segundos y lo imprimo en el label para poder tener el relog
ui.hora.label = os.date("%H:%M:%S")
GLib.timeout_add_seconds(
    GLib.PRIORITY_DEFAULT, 1,
   function()
        ui.hora.label = os.date("%H:%M:%S")
    return true
end
)

-- inicio la ventana y muestro todo
main_window:show_all()
Gtk.main()
