require_relative '../common/welt_objekt'
require_relative '../common/ressource_inhaber'
class Gegenstand < WeltObjekt # class oder module das müssen Sie entscheiden Teil der Aufgabe
  attr_reader :gewicht

  def initialize(beschreibung, gewicht)
    super(beschreibung)
    @gewicht = gewicht
  end

  def aktiv?
    return true
  end

  def verbraucht?()
    return false
  end

  def nutzbar?()
    abstract()
  end

  def to_s(kurzform = false)
    if kurzform
      super(kurzform) + "#{@gewicht}."
    else
      super(kurzform) + "[#{@gewicht} kg]"
    end
  end
end