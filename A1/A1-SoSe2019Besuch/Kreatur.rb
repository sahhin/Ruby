require "./Kreis"
require "./Dreieck"
require "./Rechteck"

class Kreatur
  
  # TODO
  # Erzeugt eine Kreatur mit Hilfe der geometrischen Primitive auf Position x,y
  def initialize(x,y)

  end

  # Macht die Kreatur sichtbar
  def sichtbar_machen()
  end

  # TODO
  # bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  # Bewegt die Kreatur wdh-mal in Richtung delta_x, delta_y. Die Geschwindigkeit der
  # Bewegung wird über den Parameter wdh_nach gesteuert. Ist wdh_nach = 10, dann bedeutet dies,
  # dass die Bewegung in delta_x, delta_y Richtung alle 10 ms wiederholt wird.
  # Die gesamte Bewegung startet nach starten_nach. 
  #
  # Eine Kreatur wird bewegt, indem alle Komponenten gleichförmig bewegt werden.
  #
  # Parameter:
  #   delta_x - Bewegung in x-Richtung
  #   delta_y - Bewegung in y-Richtung
  #   wdh - Anzahl der Einzel-Bewegungen in delta_x,delta_y Richtung 
  #   wdh_nach - Zeit zwischen zwei Einzelbewegungen in ms
  #   starten_nach - Zeitspanne ab der aktuellen Zeit, bis die gesamte Bewegung beginnt
  #
  def  bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)

  end

  # TODO 
  # Die Methode liefert die Position der Kreatur zurück
  #
  # Die Position der Kreatur ist definiert als
  # die "linke untere Ecke" des linken Fußes
  #
   def position()

   end
   
  # TODO
  # auf_position_setzen(ziel_pos_x,ziel_pos_y)
  # Verschiebt die Kreatur so, dass sie auf Position ziel_pos_x,ziel_pos_y steht
  #
  # Parameter
  #   ziel_pos_x - die x-Koordinate der neuen Position
  #   ziel_pos_y - die y-Koordinate der neuen Positione
  def auf_position_setzen(ziel_pos_x,ziel_pos_y)

  end

  def to_s()
    "Kreatur (#{@nummer})"
  end
end