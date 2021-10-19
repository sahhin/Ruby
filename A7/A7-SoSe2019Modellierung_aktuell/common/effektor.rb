require_relative '../common/effekt'
require_relative '../common/ressource_inhaber'
require_relative '../common/ressource'

module Effektor # class oder module das müssen Sie entscheiden Teil der Aufgabe

  def effekt()
    abstract()
  end

  def effekt_anwenden(ressourcen_inhaber)
    puts "#{ressourcen_inhaber.name} " + effekt.to_s() + " durch #{self.name}"
    effekt.anwenden(ressourcen_inhaber)
  end
end