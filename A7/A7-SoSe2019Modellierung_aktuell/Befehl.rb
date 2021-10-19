# Objekte dieser Klasse halten Informationen über Befehle,
# die der Benutzer eingegeben hat. Ein Befehl besteht 
# aus zwei Zeichenketten: einem Befehlswort und einem Argument
# Beim Befehl "nimm karte" beispielsweise sind die beiden
# Zeichenketten "nimm" und "karte".
# 
# Befehle werden von Nutzern dieser Klasse auf Gültigkeit
# überprüft. Wenn ein Spieler einen ungültigen Befehl eingegeben
# hat (ein unbekanntes Befehlswort), dann ist das Befehlswort nil.
# Wenn der Befehl nur aus einem Wort bestand, dann ist das
# zweite Wort nil.

# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Befehl
  
  attr_reader :befehlswort, :argumente
  #  Initialisiert das Befehlsobjekt. Beide Argumente  müssen angegeben werden,
  #  beide düfen nil sein.
  #  befehlswort: Name des Befehls. sollte <nil> sein, 
  #                wenn der Befehl für das Spiel nicht definiert ist
  #  argument: Parameter für den Befehl. 
  
  def initialize(befehlswort,argumente)
     @befehlswort = befehlswort
     @argumente = argumente
  end
  
  # Liefert true, wenn der Befehl nicht bekannt ist 
  def unbekannt?()
    return @befehlswort.nil?()
  end

  def ist_aktiver_befehl?()
    return Befehlswoerter.new().ist_aktiver_befehl?(@befehlswort)
  end

  # Liefert true, das @argumente nicht leer sind
  def hat_argumente?()
    return !@argumente.empty?()
  end
end
