class Rucksack

  include Enumerable

  def initialize(maximales_gewicht)
    @maximales_gewicht = maximales_gewicht
    @inhalt = []
  end

  def each(&b)
    @inhalt.each(&b)
  end

  def gewicht()
    return 0 if  @inhalt.empty?
    return @inhalt.inject(0){|acc,ggs| acc + ggs.gewicht}
  end

  def << gegenstand
    if gewicht() + gegenstand.gewicht() > @maximales_gewicht
     puts "#{gewicht} + Gegenstand #{gegenstand} Gewicht #{gegenstand.gewicht} überschreitet maximales Gewicht #{@maximales_gewicht}"
      return
    end
    @inhalt << gegenstand
    return self
  end

  def gegenstand_herausnehmen(beschreibung)
    gesuchter = @inhalt.find() {|ggst| ggst.name == beschreibung}
    if gesuchter.nil?()
        puts "Gegenstand #{beschreibung} nicht im Rucksack"
    end
    @inhalt.delete(gesuchter)
    return gesuchter
  end

  def to_s()
    "Rucksack:(#{gewicht()} von #{@maximales_gewicht})kg [#{@inhalt.join(", ")}]"
  end
end


# r = Rucksack.new(130)
# g = Gegenstand.new("gg1", 20)
# g2 = Gegenstand.new("gg2", 20)
#
# r << g << g2
#
# puts g.gewicht
#
# puts r.gegenstand_herausnehmen("gg1")
#
# puts r
#
# puts r.gewicht



