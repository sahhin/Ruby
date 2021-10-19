# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

require_relative "./Spiel"
welt = Spiel.instance().welt_anlegen(12,"weltdaten").spielen()

#
# require "./welt"
# require_relative "akteure/spielerin"
# welt = Welt.instance()
# welt.erschaffen(12)
#
# #welt.ausgeben()
# sp = Spielerin.new("juli",welt.raum_an_position(0,0),100,100)
# sp.wechsle_raum("east")
# sp.gegenstand_aufnehmen("flydsk")
# sp.teleportiere(4,6,"flydsk")
# puts "teleportiert"
# sp.info()