# Die Klasse modelliert die Räume in der Welt von Zuul
#
# Ein Raum repräsentiert einen Ort in der virtuellen Landschaft des Spiels
# Ein Raum ist mit anderen Räumen über Ausgänge verbunden.
# Ausgänge liegen im Norden, Osten, Süden oder Westen
# Für jede Richtung hält ein Raum eine Referenz auf den benachbarten Raum
# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

require_relative 'akteure/monster'
require_relative 'akteure/freund'
class Raum

  include Enumerable

  attr_reader :name, :x, :y

  # Erzeuge eine Raum mit einer Beschreibung
  # Ausgängen und einem Inventar
  # Zum Inventar gehören Gegenstände und Bewohner
  def initialize(beschreibung)
    @name = beschreibung
    @ausgaenge = {}
    @inventar = []
  end

  def each(&b)
    @inventar.each(&b)
  end

  def << (object)
    @inventar << object
  end

  # sucht die Bewohnern des Raums
  def bewohner()
    return @inventar.find_all() do |b|
      b.is_a?(Monster) || b.is_a?(Freund)
    end
  end

  def finde_bewohner(bewohner_name)
    bewohner.find(){|bew| bew.name == bewohner_name}
  end

  def finde_gegenstand(gegenstand_name)
     gegenstaende.find(){|ggst| ggst.name == gegenstand_name}
  end

  # SPÄTER AUFGABE 7
  # def raum_betreten(spielerin)
  #   bewohner.each(){|bew| bew.interagiere_mit(spielerin)}
  # end

  def gegenstand_ablegen(gegenstand)
    @inventar << gegenstand
  end

  def ansiedeln(akteur)
    @inventar << akteur
  end

  def gegenstand_aufheben(gegenstand_name)
    gegenstand = @inventar.find {|ggs| ggs.name == gegenstand_name}
    if gegenstand.nil?
      puts "Gegenstand #{gegenstand_name} nicht gefunden"
    else
      @inventar.delete(gegenstand)
    end
    return gegenstand
  end

  def ausgang(richtung)
    return @ausgaenge[richtung]
  end

  def setze_ausgang(richtung, raum)
    @ausgaenge[richtung] = raum
  end

  def schliesse_ausgang(richtung)
    naechster_raum = ausgang(richtung)
    @ausgaenge.delete(richtung)
  end

  def zugang?(richtung)
    return !@ausgaenge[richtung].nil?
  end

  def gegenstaende()
    @inventar.select(){|elem| elem.is_a?(Gegenstand)}
  end

  def to_s(kurzform = false)
    if kurzform
      "#@name"
    else
      "#{@name} " +
          "\n  Türen: " +
          "#{@ausgaenge.keys().join(" ")} " +
          "\n  Gegenstände: #{gegenstaende().join(", ")} " +
          "\n  Bewohner: #{bewohner().join(", ")}"
    end
  end

end
