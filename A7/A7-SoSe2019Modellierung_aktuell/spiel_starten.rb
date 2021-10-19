# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

require_relative "./Spiel"
Spiel.instance().welt_anlegen(6,"weltdaten").spielen()

#welt = Welt.instance()
#bewohner = welt.raum_an_position(1,1).bewohner()
#puts bewohner
