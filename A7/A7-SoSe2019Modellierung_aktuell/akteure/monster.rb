require_relative 'bewohner'
require_relative '../common/ressource'

class Monster < Bewohner
  attr_reader :name

  def initialize(name,lebenspunkte,effekt)
    super(name, Ressource.new(lebenspunkte, "lp"),Effekt.new(effekt,"lp", false))
  end

  def interaktions_form()
    return "attackiert"
  end
 protected :interaktions_form

end
