require_relative 'rucksack'
require_relative 'akteur'
require_relative '../common/ressource'
require_relative '../welt'

class Spielerin < Akteur

  attr_reader :name

  def initialize(name, aktueller_raum, maximale_tragkraft, lebenspunkte)
    super(name, Ressource.new(lebenspunkte, "lp"))
    @aktueller_raum = aktueller_raum
    @rucksack = Rucksack.new(maximale_tragkraft)
  end

  # Informationen, die das Spiel ggf. benötigt, um über das Spielende zu entscheiden
  # Auskunft über den Aufenthaltsort
  def position()
    return Welt.instance().position_von_raum(@aktueller_raum)
  end

  # Auskunft über den Rucksack Inhalt
  def rucksack_inhalt()
    @rucksack.map() {|ggst| ggst}
  end

  #
  ## Die vier neuen Methoden
  #


  def im_nachbarraum_umsehen(richtung)
    naechster_raum = @aktueller_raum.ausgang(richtung)
    puts naechster_raum
  end

  def attackiere(richtung, bewohner_name, gegenstand_name)
    naechster_raum = @aktueller_raum.ausgang(richtung)
    if (naechster_raum)
      bewohner = naechster_raum.finde_bewohner(bewohner_name)
      gegenstand = @rucksack.gegenstand_herausnehmen(gegenstand_name)

      if !bewohner.nil? && !gegenstand.nil?
        if gegenstand.kind_of?(Effektor)
          gegenstand.effekt_anwenden(bewohner)
        else
          puts "Gegenstand #{gegenstand_name} nicht gegen #{bewohner_name} wirksam"
        end
      end
      @rucksack << gegenstand if gegenstand && !gegenstand.verbraucht?
    end
    info()
  end

  def teleportiere(y_delta, x_delta, teleportierer_name)

  end

  def auftanken(fahrzeug_name, tankstelle_name, liter)

  end


  # Methode bereits angepasst auf das veränderte Modell
  # Ist erst lauffähig, wenn die Modelländerungen korrekt vorgenommen wurden.
  def trinke(trank_name)
    puts ("BITTE QUELLTEXT AM SCHLUSS EINKOMMENTIEREN")
    # trank = @rucksack.gegenstand_herausnehmen(trank_name)
    # return if trank.nil?()
    # unless trank.is_a?(Zaubertrank)
    #   puts "#{trank} nicht geeignet als Trank"
    #   return
    # end
    # trank.effekt_anwenden(self)
    # pruefe_gebrauchswert(trank)
    # info()
  end

  # Bereits gegegeben
  def pruefe_gebrauchswert(gegenstand)
    if (gegenstand.verbraucht?())
      puts "#{gegenstand} unwirksam - aus dem Rucksack entfernt"
    else
      @rucksack << gegenstand
    end
  end

  # Räume
  def wechsle_raum(richtung)
    naechster_raum = @aktueller_raum.ausgang(richtung)
    unless naechster_raum.nil?()
      betrete_raum(naechster_raum)
      info()
    end
  end

  def betrete_raum(raum)
    @aktueller_raum = raum
    @aktueller_raum.raum_betreten(self)
  end


  def gegenstand_aufnehmen(gegenstand_name)
    gegenstand = @aktueller_raum.gegenstand_aufheben(gegenstand_name, @rucksack.platz())
    unless gegenstand.nil?
      @rucksack << gegenstand
      info()
    end
  end

  def gegenstand_ablegen(gegenstand_name)
    gegenstand = @rucksack.gegenstand_herausnehmen(gegenstand_name)
    unless gegenstand.nil?
      @aktueller_raum.gegenstand_ablegen(gegenstand)
      info()
    end
  end

  def info()
    puts self
  end

  def to_s(kurzform = false)
    if kurzform
      super(kurzform) + "**"
    else
      super +
          " bin in #{@aktueller_raum} \nim #{@rucksack}"
    end
  end
end
