require_relative '../common/ressource_inhaber'
require_relative '../common/effektor'
require_relative '../common/effekt'
require_relative 'gegenstand_mit_ressource'


class Zaubertrank < GegenstandMitRessource # class oder module das müssen Sie entscheiden Teil der Aufgabe
  include Effektor

  def initialize(name, gewicht, lebenspunkte, staerke, positiv)
    super(name, gewicht, Ressource.new(lebenspunkte, "lp"))
    @effekt = Effekt.new(staerke, "lp", positiv)
  end

  def effekt()
    return @effekt
  end

  def effekt_anwenden(ressourcen_inhaber)
    super(ressourcen_inhaber)
    reduziere_ressource(@effekt.staerke)
  end


  def to_s(kurzform = false)
    super(kurzform) + "#{effekt.to_s(kurzform)}"
  end
end

