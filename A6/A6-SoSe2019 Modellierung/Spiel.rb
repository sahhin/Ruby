# Die Hauptklasse der Welt von Zuul
# Die Welt ist ein textbasiertes Adventure-Game
#
# Um zu spielen muss eine Instanz der Klasse erzeugt werden und die
# Methode spielen aufgerufen werden
#
# Spiel erzeugt alle Objekte, die für das Spiel notwendig sind,
# und startet das Spiel

# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

require_relative 'gegenstaende/gegenstand'
require_relative 'akteure/spielerin'
require "./Welt"
require "./Parser"
require 'singleton'

class Spiel

  include Singleton

  # Erzeugt die Räume in Zuul und den Parser für die Eingabe
  def initialize()
    @aktuelle_spielerin = nil
    @welt = nil
    @parser = Parser.new()
  end


  # Räume erzeugen und verbinden
  def welt_anlegen(welt_groesse,weltdaten)
    @welt = Welt.instance()
    @welt.erschaffen(welt_groesse,weltdaten)
    @welt.tunnel_vertikal(1, 1, 4)
    @welt.sackgasse(5, 1, SpielUtility::NORDEN)
    @welt.tunnel_horizontal(1, 2, 3)
    @welt.sackgasse(1, 4, SpielUtility::WESTEN)
    @aktuelle_spielerin = Spielerin.new("Julia", @welt.raum_an_position(0, 0), 130, 100)
    return self
  end

  # Das Spiel starten.
  def spielen()
    willkommenstext()
    beendet = false
    # Solange spielen, bis ein Spieler das Spiel beendet
    while (!beendet)
      befehl = @parser.liefere_befehl()
      beendet = verarbeite_befehl(befehl)
    end
    puts("Sie haben ein einfaches Spiel sehr gluecklich gemacht")
  end

  # Begruessung und Info fuer die spielenden Personen
  def willkommenstext()
    puts("Willkommen bei Zuul\n" +
             "-- einem interessanter werdenden Spiel\n" +
             "Geben Sie 'help' ein, wenn Sie Hilfe brauchen\n" +
             "\n")
    @welt.ausgeben()
    @aktuelle_spielerin.info()
  end

  # Wechsle den Raum, wenn es einen Ausgang gibt
  # Sonst gib eine Fehlermeldung aus
  def wechsle_raum(befehl)
    if (!befehl.hat_argumente?())
      puts "Keine Richtung angegeben"
      return
    end
    richtung = befehl.argumente()[0]
    @aktuelle_spielerin.wechsle_raum(richtung)
  end


  def gegenstand_mitnehmen(befehl)
    if (!befehl.hat_argumente?())
      puts "Keine Gegenstand angegeben"
      return
    end
    @aktuelle_spielerin.gegenstand_aufnehmen(befehl.argumente()[0])
  end

  def gegenstand_hinwerfen(befehl)
    if (!befehl.hat_argumente?())
      puts "Keine Gegenstand angegeben"
      return
    end
    @aktuelle_spielerin.gegenstand_ablegen(befehl.argumente()[0])
  end

  # Fuehre den 'befehl' aus
  # Liefert true, wenn das Spiel mit dem Befehl beendet wird sonst false
  def verarbeite_befehl(befehl)
    moechte_beenden = false;
    if befehl.unbekannt?()
      puts("Was soll ich tun?")
      return moechte_beenden
    end
    case befehl.befehlswort()
    when 'help'
      hilfe_ausgeben()
    when 'go'
      wechsle_raum(befehl)
    when 'quit'
      moechte_beenden = beenden(befehl)
    when 'look'
      umsehen(befehl)
    when 'look_ahead'
      im_nachbarraum_umsehen(befehl)
    when "take"
      gegenstand_mitnehmen(befehl)
    when "drop"
      gegenstand_hinwerfen(befehl)
    when "attack"
      attackieren(befehl)
    when 'teleport'
      teleportieren(befehl)
    when "fuel"
      auftanken(befehl)
    end
    return moechte_beenden
  end

  # TODO
  def attackieren(befehl)
    (puts "Wen soll ich angreifen "; return) if !befehl.hat_argumente?()
    (puts "Mit was soll ich angreifen"; return) if befehl.argumente().size() < 3
    @aktuelle_spielerin.attackiere(befehl.argumente[0], befehl.argumente[1], befehl.argumente[2])
  end

  def teleportieren(befehl)
    (puts "Wohin soll es gehen?"; return) if !befehl.hat_argumente?()
    (puts "Vertikale Richtung oder Teleporter Name fehlen"; return) if befehl.argumente().size() < 3
    begin
      x = Integer(befehl.argumente[0])
      y = Integer(befehl.argumente[1])
      teleporter = befehl.argumente[2]
      @aktuelle_spielerin.teleportiere(x, y, teleportierer)
    rescue ArgumentError
      puts "Es werden nur ganze Zahlen für die Richtung akzeptiert"
    end
  end

  def auftanken(befehl)
    (puts "Wo soll ich was auftanken?"; return) if !befehl.hat_argumente?()
    (puts "Fahrzeug nicht angegeben"; return) if befehl.argumente.size() < 3
    begin
      @aktuelle_spielerin.auftanken(befehl.argumente()[0], befehl.argumente[1], Integer(befehl.argumente[2]))
    rescue ArgumentError
      puts "Es werden nur ganze Zahlen für die Liter akzeptiert"
      @aktuelle_spielerin.info()
    end
  end

  # Kurze Hinweise ueber die moeglichen Befehle
  def hilfe_ausgeben()
    puts("Folgende Befehle zur Verfügung: ")
    @parser.befehle_ausgeben()
  end

  def umsehen(befehl)
    (puts "Wo soll ich mich umsehen?"; return) if befehl.hat_argumente?()
    @aktuelle_spielerin.info()
  end

  def im_nachbarraum_umsehen(befehl)
    (puts "In welcher Richtung soll ich mich umsehen"; return) if !befehl.hat_argumente?()
    @aktuelle_spielerin.im_nachbarraum_umsehen(befehl.argumente()[0])
  end

  def beenden(befehl)
    (puts "Was soll beendet werden?"; return false) if befehl.hat_argumente?()
    return true # beende das Spiel
  end

  private :willkommenstext
end
