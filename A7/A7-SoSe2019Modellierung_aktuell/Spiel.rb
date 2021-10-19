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
require "Singleton"

class Spiel

  include Singleton
  # Erzeugt die Räume in Zuul und den Parser für die Eingabe
  def initialize()
    @aktuelle_spielerin = nil
    @welt = nil
    @parser = Parser.new()
  end


  # Räume erzeugen und verbinden
  def welt_anlegen(welt_groesse, weltdaten)
    @welt = Welt.instance()
    @welt.erschaffen(welt_groesse, weltdaten)
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
    will_beenden = false
    # Solange spielen, bis eine Spielerin das Spiel beendet
    # Die Spielerin nicht mehr lebendig ist
    # oder das Spielziel erreicht ist
    while (!will_beenden && !spiel_beendet?())
      befehl = @parser.liefere_befehl()
      will_beenden = verarbeite_befehl(befehl)
      Welt.instance().aufraeumen()
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

  # Fuehre den 'befehl' aus
  # Liefert true, wenn das Spiel mit dem Befehl beendet wird sonst false
  def verarbeite_befehl(befehl)
    moechte_beenden = false;
    if befehl.unbekannt?()
      puts("Was soll ich tun?")
      hilfe_ausgeben
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
    when "drink"
      trinken(befehl)
    when "attack"
      attackieren(befehl)
    when 'teleport'
      teleportieren(befehl)
    when "fuel"
      auftanken(befehl)
    when "overview"
      ueberblick_geben(befehl)
    end
    return moechte_beenden
  end

  # Die Methode prüft, ob das Spiel beendet ist
  def spiel_beendet?()
    if !@aktuelle_spielerin.lebendig?
      puts "#{@aktuelle_spielerin.name} hat die Abenteuer nicht überlebt\nGame Over!"
      return true
    else
      return ziel_erreicht?()
    end
  end

  # TODO Hier müssen Sie prüfen, ob die Spielerin das Spiel erfolgreich beendet hat!
  # TODO Das hängt natürlich von Ihren Spielregeln ab!
  def ziel_erreicht?()
    return  @aktuelle_spielerin.position == Welt.instance.letzte_quadrant()

  end

  # Wechsle den Raum, wenn es einen Ausgang gibt
  # Sonst gib eine Fehlermeldung aus
  def wechsle_raum(befehl)
    if (!befehl.hat_argumente?())
      hinweis_geben(befehl.befehlswort(),"richtung")
      return
    end
    richtung = befehl.argumente()[0]
    @aktuelle_spielerin.wechsle_raum(richtung)
  end

  # Methode gibt das Befehlswort und die erwarteten Argumente aus
  def hinweis_geben(befehl_name, *befehlargs)
    puts "\nFEHLERHAFTE EINGABE! VERWENDE: #{befehl_name} #{befehlargs.map(){|arg|"<#{arg}>"}.join(" ")}\n\n"
  end
  private :hinweis_geben

  def gegenstand_mitnehmen(befehl)
    if (!befehl.hat_argumente?())
      hinweis_geben("take","gegenstand_name")
      return
    end
    @aktuelle_spielerin.gegenstand_aufnehmen(befehl.argumente()[0])
  end

  def gegenstand_hinwerfen(befehl)
    if (!befehl.hat_argumente?())
      hinweis_geben("drop", "gegenstand_name")
      return
    end
    @aktuelle_spielerin.gegenstand_ablegen(befehl.argumente()[0])
  end

  def trinken(befehl)
    if !befehl.hat_argumente?()
      hinweis_geben(befehl.befehlswort(), "getraenk_name")
      return
    end
    @aktuelle_spielerin.trinke(befehl.argumente[0])
  end

  def ueberblick_geben(befehl)
    if befehl.hat_argumente?()
      hinweis_geben("overview")
      return
    end
    Welt.instance().ausgeben()
  end

  # attackiere(richtung, bewohner_name, gegenstand_name)
  def attackieren(befehl)
    if !befehl.hat_argumente?() || befehl.argumente().size() < 3
      hinweis_geben("attack", "richtung", "bewohner_name", "gegenstand_name")
      return
    end
    @aktuelle_spielerin.attackiere(befehl.argumente[0], befehl.argumente[1], befehl.argumente[2])
  end

  # teleportiere(x,y,teleportierer_name)
  def teleportieren(befehl)
    if !befehl.hat_argumente?() || befehl.argumente.size() < 3
      hinweis_geben("teleport", "teleporter_name", "vertikal", "horizontal")
      return
    end
    begin
      vertikal = Integer(befehl.argumente[1])
      horizontal = Integer(befehl.argumente[2])
      teleporter = befehl.argumente[0]
      @aktuelle_spielerin.teleportiere(vertikal, horizontal, teleporter)
    rescue ArgumentError => ae
      puts "Es werden nur ganze Zahlen für die Richtung akzeptiert"
    end
  end

  #  auftanken(fahrzeug_name, tankstelle_name,liter)
  def auftanken(befehl)
    if !befehl.hat_argumente?() || befehl.argumente.size() < 3
      hinweis_geben("fuel","teleporter_name","tankstelle_name","liter")
      return
    end
    begin
      @aktuelle_spielerin.auftanken(befehl.argumente()[0], befehl.argumente[1], Integer(befehl.argumente[2]))
    rescue ArgumentError
      puts "Es werden nur ganze Zahlen für die Literangabe akzeptiert"
      @aktuelle_spielerin.info()
    end
  end

  # Kurze Hinweise ueber die moeglichen Befehle
  def hilfe_ausgeben()
    puts("Folgende Befehle zur Verfügung: ")
    @parser.befehle_ausgeben()
  end

  def umsehen(befehl)
    if befehl.hat_argumente?()
      hinweis_geben(befehl.befehlswort())
      return
    end
    @aktuelle_spielerin.info()
  end

  def im_nachbarraum_umsehen(befehl)
    if !befehl.hat_argumente?()
      hinweis_geben(befehl.befehlswort(),"richtung")
      return
    end
    @aktuelle_spielerin.im_nachbarraum_umsehen(befehl.argumente()[0])
  end

  def beenden(befehl)
    (puts "Was soll beendet werden?"; return false) if befehl.hat_argumente?()
    return true # beende das Spiel
  end

  private :willkommenstext
end
