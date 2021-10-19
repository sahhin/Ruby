require_relative '../common/ressource_inhaber'
require_relative '../common/../common/welt_objekt'
require_relative '../common/ressource'
require_relative '../common/effekt'

class Akteur < WeltObjekt # class oder module das müssen Sie entscheiden Teil der Aufgabe
  include RessourceInhaber

  def initialize(name, lebenspunkte)
    super(name)
    @ressource = lebenspunkte
  end

  def ressource()
    return @ressource
  end

  def lebendig?
    return ressource.hoehe > 0
  end

  def to_s(kurzform=false)
    if kurzform
      super(kurzform) + ressource.to_s(kurzform)
    else
      super(kurzform) + "(" + ressource.to_s(kurzform) + ") "
    end
  end
end