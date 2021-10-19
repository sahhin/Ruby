class Rucksack

  include Enumerable

  def initialize(maximales_gewicht)
    @maximales_gewicht = maximales_gewicht
    @inhalt = []
  end

  def gewicht()
    return @inhalt.inject(0){|acc,ggs| acc + ggs.gewicht}
  end

  def each(&b)
    @inhalt.each(&b)
    return self
  end

  def << gegenstand
    if gewicht() + gegenstand.gewicht() > @maximales_gewicht
     puts "#{gewicht} + Gegenstand #{gegenstand} Gewicht #{gegenstand.gewicht} überschreitet maximales Gewicht #{@maximales_gewicht}"
      return
    end
    @inhalt << gegenstand
    return self
  end

  def gegenstand_herausnehmen(name)
    gesuchter = @inhalt.find() {|ggst| ggst.name == name}
    if gesuchter.nil?()
        puts "Gegenstand #{name} nicht im Rucksack"
    end
    @inhalt.delete(gesuchter)
    return gesuchter
  end

  def platz()
    return @maximales_gewicht-gewicht
  end

  def to_s()
    "Rucksack:(#{gewicht()} von #{@maximales_gewicht})kg [#{@inhalt.join(", ")}]"
  end
end



