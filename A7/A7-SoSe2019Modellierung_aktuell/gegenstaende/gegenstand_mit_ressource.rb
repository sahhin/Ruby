require_relative 'gegenstand'
require_relative '../common/ressource'
class GegenstandMitRessource < Gegenstand # class oder module das müssen Sie entscheiden Teil der Aufgabe
  include RessourceInhaber

  def initialize(beschreibung, gewicht, ressource)
    super(beschreibung, gewicht)
    @ressource = ressource
  end

  def ressource()
    return @ressource
  end

  def to_s(kurzform=false)
    if kurzform
      super(kurzform) + "#{ressource.to_s(kurzform)}"
    else
      super(kurzform)+ " " + ressource_praefix +  ressource.to_s(kurzform)
    end
  end
end