require_relative 'bewohner'
require_relative '../common/ressource'

class Freund < Bewohner
  def initialize(name, lebenspunkte, effekt)
    super(name, Ressource.new(lebenspunkte, "lp"), Effekt.new(effekt, "lp"))
  end

  def interaktions_form()
    return "hilft"
  end

  protected :interaktions_form

end


