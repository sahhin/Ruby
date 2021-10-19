require_relative '../common/effektor'
require_relative '../common/effekt'
require_relative 'gegenstand'
require_relative '../common/ressource_inhaber'
require_relative '../common/ressource'



class Waffe < Gegenstand # class oder module das müssen Sie entscheiden Teil der Aufgabe
  include Effektor

#  private_class_method :new

  def initialize(name, gewicht, staerke)
    super(name, gewicht)
    @effekt = Effekt.new(staerke, "lp", false )
    @einsatz = 0
  end

  def effekt()
    return @effekt
  end

  def effekt_anwenden(ressourcen_inhaber)
    if nutzbar?
      super
    else
      puts "Ich #{self.class.name} #{@name} #{@gewicht} nimmt Dir #{effekt.staerke} lp momentan in der Wartung"
    end
    @einsatz += 1
  end

  def nutzbar?()
    return @einsatz % 4 == 0
  end
end


