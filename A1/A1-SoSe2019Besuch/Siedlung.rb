
require "./Haus"
require "./Kreatur"

class Siedlung
  
  # Eine Siedlung besteht aus 5 im Kreis angeordneten Häusern und einer Kreatur in der Mitte
  # der Siedlung
  def initialize()
    @haus1 = Haus.new()
    @haus2 = Haus.new()
    @haus3 = Haus.new()
    @haus4 = Haus.new()
    @haus5 = Haus.new()
    @kreatur = Kreatur.new(600, 500)

    #auf die gewünschte Positionen setzen
    @haus1.auf_position_setzen(500,200)
    @haus2.auf_position_setzen(900,400)
    @haus3.auf_position_setzen(1000, 800)
    @haus4.auf_position_setzen(300,900)
    @haus5.auf_position_setzen(150, 600)


  end

  # Stellt die Häuser und die Kreatur auf dem Bildschirm dar
  def sichtbar_machen()
    @haus1.sichtbar_machen()
    @haus2.sichtbar_machen()
    @haus3.sichtbar_machen()
    @haus4.sichtbar_machen()
    @haus5.sichtbar_machen()
    @kreatur.sichtbar_machen()
  end

  # Lässt die Kreatur eines der Häuser besuchen. Die Kreatur bewegt sich auf auf die Tür des Hauses zu und
  # bleibt vor dieser stehen
  def besuch()
    @kreatur.auf_position(1000, 800)

  end
    
  def to_s()
    "Siedlung (#{@nummer})"
  end
end