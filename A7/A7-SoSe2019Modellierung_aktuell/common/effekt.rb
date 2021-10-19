require_relative '../common/ressource_inhaber'
require_relative '../common/ressource'


class Effekt # class oder module das müssen Sie entscheiden Teil der Aufgabe
  attr_reader :staerke, :einheit

  def initialize(staerke, einheit, positiv = true)
    @staerke = staerke
    @einheit = einheit
    @positiv = positiv
  end

  def anwenden(ressource_inhaber)
    if @positiv
      ressource_inhaber.erhoehe_ressource(@staerke)
    else
      ressource_inhaber.reduziere_ressource(@staerke)
    end
  end

  def positiv?()
    return @positiv
  end

  def to_s(kurzform = false)
    if kurzform
      return "#{@staerke}"
    else
      if positiv?
        return "gebe Dir #{@staerke}#{@einheit}"
      else
        return "nehme Dir #{@staerke}#{@einheit}"
      end
    end
  end
end