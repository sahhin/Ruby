require_relative '../common/ressource_inhaber'
require_relative 'gegenstand_mit_ressource'

class Tankstelle < GegenstandMitRessource # class oder module das müssen Sie entscheiden Teil der Aufgabe

  def initialize(name, liter)
    super(name, Float::INFINITY, Ressource.new(liter, "l"))
  end

  def ressource_praefix()
    return "Vorrat:"
  end
  protected :ressource_praefix

  def betanken(fahrzeug,liter)
    if ressource.hoehe > liter
      fahrzeug.erhoehe_ressource(liter)
      reduziere_ressource(liter)
    else
      puts "Zapfsäule #{@name} hat nicht ausreichend Krafstoff: #{ressource.hoehe} < #{liter} "
    end
  end

  # def gegenstand_spezifisch_to_s(kurzform = false)
  #   if kurzform
  #     return ".#{@liter}"
  #   else
  #     return " Vorrat: #{@liter}liter"
  #   end
  # end
end