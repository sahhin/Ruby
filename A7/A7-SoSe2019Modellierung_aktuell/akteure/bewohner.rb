require_relative 'akteur'
require_relative '../common/effektor'
require_relative '../common/effekt'
require_relative '../common/ressource'
require_relative '../common/object'


class Bewohner < Akteur # class oder module das müssen Sie entscheiden Teil der Aufgabe
  include Effektor

  def initialize(name, lebenspunkte, effekt)
    super(name, lebenspunkte)
    @effekt = effekt
  end

  def effekt()
    return @effekt
  end

  def interagiere_mit(spielerin)
    if self.lebendig?
      if effekt.staerke <= ressource.hoehe
        puts "#{self.name} " + interaktions_form + " #{spielerin.name()} mit #{@effekt.staerke} lp"
        effekt.anwenden(spielerin)
      else
        puts "#{self.name} ist zu schwach " + interaktions_form + "#{spielerin.name} nicht"
      end
    else
      return "Toter #{self.class.name} ist aus dem Spiel."
    end
  end

  def interaktions_form()
    abstract()
  end

  protected :interaktions_form

  def to_s(kurzform = false)
    super(kurzform) + effekt.to_s(kurzform)
  end


end



