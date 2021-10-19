
class Freund

def initialize(name, lebenspunkte, effekt)
  @name         = name
  @lebenspunkte = lebenspunkte
  @effekt       = effekt
end

  def to_s(kurzform = false)
    if kurzform
      return "#{self.class.name[0]}.#{@lebenspunkte}.#{@effekt}"
    else
      return "Ich #{self.class.name} #{@name}(#{@lebenspunkte}lp) schenke Dir #{@effekt}lp"
    end
  end
end