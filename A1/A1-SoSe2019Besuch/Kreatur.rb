require "./Kreis"
require "./Dreieck"
require "./Rechteck"
require "./Haus"
require "./Point"
class Kreatur
  # TODO
  # Erzeugt eine Kreatur mit Hilfe der geometrischen Primitive auf Position x,y
  def initialize(x,y)
    @x       = x
    @y       = y
    @hut     = Dreieck.new(x + 15, y - 110, 30, 30, "red", false)
    @kopf    = Kreis.new(x + 15, y - 85, 15, "red", false )
    @koerper = Kreis.new(x + 15, y - 30, 40, "red", false)
    @arm_1   = Rechteck.new(x + 50, y - 30, 10,50, "red", false)
    @arm_2   = Rechteck.new(x - 30, y - 30, 10, 50, "red", false)
    @bein_1  = Rechteck.new(x + 25, y, 10, 40, "red", false)
    @bein_2  = Rechteck.new(x, y, 10,40, "red",false)

  end

  # Macht die Kreatur sichtbar
  def sichtbar_machen()
    @hut.sichtbar_machen()
    @kopf.sichtbar_machen()
    @koerper.sichtbar_machen()
    @arm_1.sichtbar_machen()
    @arm_2.sichtbar_machen()
    @bein_1.sichtbar_machen()
    @bein_2.sichtbar_machen()
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
    @hut.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @kopf.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @koerper.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @arm_1.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @arm_2.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @bein_1.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
    @bein_2.bewegen(delta_x, delta_y, wdh, wdh_nach, starten_nach)
  end

  # TODO 
  # Die Methode liefert die Position der Kreatur zurück
  #
  # Die Position der Kreatur ist definiert als
  # die "linke untere Ecke" des linken Fußes
  #
   def position()
     punkt = Point.new(@bein_2.obere_linke_ecke.x, @bein_2.obere_linke_ecke.y+@bein_2.hoehe)
     return punkt
   end
   
  # TODO
  # auf_position_setzen(ziel_pos_x,ziel_pos_y)
  # Verschiebt die Kreatur so, dass sie auf Position ziel_pos_x,ziel_pos_y steht
  #
  # Parameter
  #   ziel_pos_x - die x-Koordinate der neuen Position
  #   ziel_pos_y - die y-Koordinate der neuen Positione
  def auf_position(ziel_pos_x,ziel_pos_y)
    bewegen(ziel_pos_x-position.x, ziel_pos_y-position.y, 1,  1, 0)
  end

  def to_s()
    "Kreatur (#{@nummer})"
  end
end