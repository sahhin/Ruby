require_relative 'gegenstand_mit_ressource'
require_relative '../common/ressource'
require_relative '../welt'
require_relative '../Raum'
require_relative '../welt'

class Teleporter < GegenstandMitRessource # class oder module das müssen Sie entscheiden Teil der Aufgabe

  def initialize(name, gewicht, strecke_in_quadranten)
    super(name, gewicht, Ressource.new(strecke_in_quadranten, "Quadranten"))
  end

  def ressource_praefix()
    return "überwindet"
  end

  protected :ressource_praefix

  def teleportiere(y, x, y_richtung, x_richtung)
    if (ressource.hoehe() > (x_richtung.abs() + y_richtung.abs()))
      if Welt.instance().gueltiger_quadrant?(x + x_richtung, y + y_richtung)
        reduziere_ressource(x_richtung + y_richtung)
        return Welt.instance.raum_an_position(x + x_richtung, y + y_richtung)
      else
        puts "Quadrant_#{x + x_richtung}_#{y + y_richtung} Flug geht ins Nirwana: Teleportation nicht möglich"
        return nil
      end
    else
      puts "Nicht ausreichend Treibstoff in #{self.name} fuer #{x_richtung.abs() + y_richtung.abs()} > #{ressource.hoehe})"
      return nil
    end
  end


=begin
  def gegenstand_spezifisch_to_s(kurzform = false)
    if kurzform
      return ".#{@strecke_in_quadranten}"
    else
      return " überwindet #{@strecke_in_quadranten} Quadranten"
    end
  end
=end

end
#
# teleporter = Teleporter.new("a","120","120")
# p  teleporter
#
# puts teleporter.aktiv?