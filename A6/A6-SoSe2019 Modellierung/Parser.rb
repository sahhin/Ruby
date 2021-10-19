require_relative  "./Befehl"
require_relative  "./Befehlswoerter"
# Die Klasse zum Einlesen der Benutzereingaben und zur Umwandlung in Befehle
# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Parser
  
  def initialize()
    @befehle = Befehlswoerter.new()
  end
  
  # Liefert den nächsten Befehl eines Benutzers
  # Liest die Eingabe des Benutzers, 
  # zerlegt diese in Befehlswort und Befehlsargument
  # und erzeugt ein entsprechendes Befehlsobjekt
  def liefere_befehl()
    print( "> ")
    # Zeile lesen
    eingabe = gets().chomp!
    # Zeile in Wörter zerlegen
    woerter = eingabe.split();
    # Wörter von Leerzeichen bereinigen
    woerter.each {|wort| wort.strip!()}
    rest= []
    # Prüfen, ob die Eingabe ein bekannter Befehl ist
    if (woerter.size() > 0)
      wort1 = woerter[0]
    end
    # Parameter einlesen
    if (woerter.size() > 1 )
      rest = woerter[1...woerter.size()]
    end
    if (@befehle.ist_befehl?(wort1))
      return Befehl.new(wort1,rest)
    else
      return Befehl.new(nil,rest)
    end  
  end

  def befehle_ausgeben
    @befehle.alle_ausgeben()
  end

  def befehle_ausgeben
    puts @befehle
  end

  def ist_aktiver_befehl?(befehl)
    @befehle.ist_aktiver_befehl?(befehl.befehlswort)
  end

end
