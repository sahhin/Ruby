require_relative "gegenstand"
class Zaubertrank < Gegenstand
  def initialize(name, gewicht, effekt, reichweite = effekt, verbraucht_sich = false)
    super(name, gewicht)

    @effekt = effekt
    @reichweite = reichweite
    @verbraucht_sich = verbraucht_sich
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    if kurzform
      return ".#{@effekt}.#{@reichweite}"
    else
      return " schenkt/kostet #{@effekt}lp Reichweite #{@reichweite}lp"
    end
  end
end