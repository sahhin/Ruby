class Gegenstand

  attr_reader :name, :gewicht

  def initialize(beschreibung, gewicht)
    @name = beschreibung
    @gewicht = gewicht
    @verbraucht = false
  end

  def verbraucht?()
    return @verbraucht
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return [name, gewicht] == [other.name, other.gewicht]
  end

  def to_s(kurzform = false)
    if kurzform
      return "#{self.class.name[0,2]}.#{@gewicht}" + gegenstand_spezifisch_to_s(kurzform)
    else
      return "#@name(#{@gewicht}kg)" + gegenstand_spezifisch_to_s()
    end
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    ""
  end

end