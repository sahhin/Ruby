# Die Klasse, die die gültigen Befehlsworte in Zuul verwaltet
# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Befehlswoerter
  # Eine Klassenkonstante für die in Zuul bekannten Befehle
  GUELTIGE_BEFEHLE = [ "go", "quit", "help", "look", "look_ahead", "drop", "take", "drink","teleport", "attack", "fuel","overview"]
    
  # Prüfe ob eine Befehlswort ein gültiges Wort ist  
  def ist_befehl?(wort)
    return GUELTIGE_BEFEHLE.include?(wort)
  end

  def ist_aktiver_befehl?(befehls_wort)
    return [ "go", "look_ahead", "drop", "take", "drink", "teleport", "attack","back"].include?(befehls_wort)
  end

  def alle_ausgeben()
    GUELTIGE_BEFEHLE.each {|befehl| print befehl + ' '}
    puts
  end

  def to_s()
    GUELTIGE_BEFEHLE.join(" ")
  end
end
