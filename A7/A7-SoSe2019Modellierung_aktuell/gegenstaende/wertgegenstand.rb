require_relative 'gegenstand'
class Wertgegenstand  < Gegenstand# class oder module das müssen Sie entscheiden Teil der Aufgabe

  def initialize(name,gewicht,wert)
    super(name, gewicht)
    @wert = wert
  end

end

class Diamand < Wertgegenstand
  
end