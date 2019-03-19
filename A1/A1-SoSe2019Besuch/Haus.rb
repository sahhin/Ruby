require "./Kreis"
require "./Dreieck"
require "./Rechteck"
require "./Point"

class Haus

  #TODO
  def initialize()
    #Haus besteht aus Dach, Tür und Fenster
    # Dach ist ein Dreiecker
    @wand    = Rechteck.new( 10,  50,  100,  100, "yellow", false)
    @tuer    = Rechteck.new(25, 110, 30,40, "blue", false)
    @dach    = Dreieck.new(60, 25, 50, 100, "green", false )
    @fenster = Rechteck.new(65, 60, 20, 20, "black", false)
  end

  #TODE
  def sichtbar_machen()
    @wand.sichtbar_machen()
    @tuer.sichtbar_machen()
    @dach.sichtbar_machen()
    @fenster.sichtbar_machen()
  end

  # TODO
  # bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
  # Bewegt das Haus wdh-mal in Richtung delta_x, delta_y. Die Geschwindigkeit der
  # Bewegung wird über den Parameter wdh_nach gesteuert. Ist wdh_nach = 10, dann bedeutet dies,
  # dass die Bewegung in delta_x, delta_y Richtung alle 10 ms wiederholt wird.
  # Die gesamte Bewegung startet nach starten_nach. 
  #
  # Wenn das Haus sichtbar ist, dann wird dieses animiert über den Bildschirm bewegt
  #
  # Ein Haus wird bewegt, indem alle Komponenten gleichförmig bewegt werden.
  #
  # Parameter:
  #   delta_x - Bewegung in x-Richtung
  #   delta_y - Bewegung in y-Richtung
  #   wdh - Anzahl der Einzel-Bewegungen in delta_x,delta_y Richtung 
  #   wdh_nach - Zeit zwischen zwei Einzelbewegungen in ms
  #   starten_nach - Zeitspanne ab der aktuellen Zeit, bis die gesamte Bewegung beginnt
  #
  def bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @wand.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @dach.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @tuer.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)
    @fenster.bewegen(delta_x,delta_y,wdh,wdh_nach,starten_nach)

  end

  # TODO 
  # Die Methode liefert die Position des Hauses zurück
  #
  # Die Position der Hauses ist definiert als
  # linke untere Ecke des Mauerwerks
  #

  def position()
    punkt = Point.new(@wand.obere_linke_ecke.x, @wand.obere_linke_ecke.y+@wand.hoehe)
    return punkt
  end
   
  # TODO
  # auf_position_setzen(ziel_pos_x,ziel_pos_y)
  # Verschiebt das Haus so, dass es auf position ziel_pos_x,ziel_pos_y steht
  #
  # Parameter
  #   ziel_pos_x - die x-Koordinate der linken unteren Ecke des Fusses der Stehlampe
  #   ziel_pos_y - die y-Koordinate der linken unteren Ecke des Fusses der Stehlampe

  def auf_position_setzen(ziel_pos_x,ziel_pos_y)
    bewegen(ziel_pos_x-position.x, ziel_pos_y-position.y, 1,  1, 0)
  end


  def to_s()
    "Haus (#{@nummer})"
  end
end