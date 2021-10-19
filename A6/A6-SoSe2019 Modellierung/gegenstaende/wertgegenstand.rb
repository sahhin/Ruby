class Wertgegenstand < Gegenstand

  def initialize(name, gewicht, wert)
    super(name, gewicht)

    @wert = wert
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    if kurzform
      return ".#{@wert}"
    else
      return " Wert #{@wert}"
    end
  end

end
