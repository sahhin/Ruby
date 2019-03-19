
require "./Haus"
require "./Kreatur"

class Siedlung
  
  # Eine Siedlung besteht aus 5 im Kreis angeordneten Häusern und einer Kreatur in der Mitte
  # der Siedlung
  def initialize()

  end

  # Stellt die Häuser und die Kreatur auf dem Bildschirm dar
  def sichtbar_machen()

  end

  # Lässt die Kreatur eines der Häuser besuchen. Die Kreatur bewegt sich auf auf die Tür des Hauses zu und
  # bleibt vor dieser stehen
  def besuch()

  end
    
  def to_s()
    "Siedlung (#{@nummer})"
  end
end