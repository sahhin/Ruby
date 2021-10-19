# Die Klasse modelliert die Räume in der Welt von Zuul
#
# Ein Raum repräsentiert einen Ort in der virtuellen Landschaft des Spiels
# Ein Raum ist mit anderen Räumen über Ausgänge verbunden.
# Ausgänge liegen im Norden, Osten, Süden oder Westen
# Für jede Richtung hält ein Raum eine Referenz auf den benachbarten Raum
# Author::    Birgit Wendholt
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

require_relative 'akteure/bewohner'
require_relative 'gegenstaende/gegenstand'

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
    return self
  end

  def << (object)
    @inventar << object
    return self
  end

  # sucht die Bewohnern des Raums
  def bewohner()
    return @inventar.find_all() do |b|
      b.is_a?(Bewohner)
    end
  end
  private :bewohner

  def finde_bewohner(bewohner_name)
    der_bewohner = bewohner.find(){|bew| bew.name == bewohner_name}
    if der_bewohner.nil?
      drucke_hinweis("Bewohner", bewohner_name)
    end
    return der_bewohner
  end

  def finde_gegenstand(gegenstand_name)
    gegenstand = gegenstaende.find(){|ggst| ggst.name == gegenstand_name}
    if gegenstand.nil?
      drucke_hinweis("Gegenstand", gegenstand_name)
    end
    return gegenstand
  end

  def raum_betreten(spielerin)
    bewohner.each(){|bew| bew.interagiere_mit(spielerin)}
    return self
  end

  def gegenstand_ablegen(gegenstand)
    @inventar << gegenstand
    return self
  end

  def gegenstand_aufheben(gegenstand_name,gewicht)
    gegenstand = @inventar.find {|ggs| ggs.name == gegenstand_name &&  ggs.gewicht() <=gewicht}
    if gegenstand.nil?
      drucke_hinweis_2("Gegenstand", gegenstand_name,gewicht)
    else
      @inventar.delete(gegenstand)
    end
    return gegenstand
  end

  # Entfernt ein Objekt aus dem Raum
  def entferne_objekt(gegenstand_oder_bewohner)
    @inventar.delete(gegenstand_oder_bewohner)
  end


  def drucke_hinweis(klazz_string,objekt_name)
    puts "#{klazz_string} #{objekt_name} nicht im Raum #{name}"
  end

  def drucke_hinweis_2(klazz_string,objekt_name,gewicht)
    puts "#{klazz_string} #{objekt_name} nicht im Raum #{name} oder #{objekt_name} schwerer als #{gewicht}kg"
  end

  def ausgang(richtung)
    ausgang =@ausgaenge[richtung]
    if (ausgang.nil?())
      puts "Kein Ausgang aus #{name} in Richtung #{richtung}"
    end
    return ausgang
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
  private :gegenstaende

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
