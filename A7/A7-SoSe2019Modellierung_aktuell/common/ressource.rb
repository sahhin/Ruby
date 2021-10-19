class Ressource # class oder module das müssen Sie entscheiden Teil der Aufgabe
  attr_reader :hoehe, :einheit
  def initialize(hoehe, einheit)
    @hoehe = hoehe
    @einheit = einheit
  end

  def reduziere(betrag)
    @hoehe -= betrag
  end

  def erhoehe(betrag)
    @hoehe += betrag
  end

  def verbraucht?()
    return @hoehe <= 0
  end

  def to_s(kurzform = false)
    if kurzform
      return "#{@hoehe}."
    end
    return "#{@hoehe}#{@einheit}"
  end
end