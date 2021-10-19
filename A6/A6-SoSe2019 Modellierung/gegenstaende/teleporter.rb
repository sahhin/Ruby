require_relative "gegenstand"

class Teleporter < Gegenstand

  def initialize(name, gewicht, strecke_in_quadranten)
    super(name, gewicht)

    @strecke_in_quadranten = strecke_in_quadranten
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    if kurzform
      return ".#{@strecke_in_quadranten}"
    else
      return " überwindet #{@strecke_in_quadranten} Quadranten"
    end
  end

end