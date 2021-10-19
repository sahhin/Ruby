require "tk"
require "./Turtle"
require "./Point"

class Vegetation
  BAUM = 1
  RANKE = 2
  BAUM_LAENGE = 64
  RANKE_LAENGE = 32
  BAUM_BREITE = 2
  RANKE_BREITE = BAUM_BREITE
  BAUM_WINKEL = 22
  RANKE_WINKEL = 28

  C0 = "#808000" # Olive
  C1 = "#3CB371" # MediumSeaGreen
  C2 = "#66CDAA" # MediumAquamarine
  C3 = "#90EE90" # LightGreen

  def zeichnen(typ, wiederholungen, x, y)
    # Turtle schaut nach Norden
    @turtle = Turtle.new(x, y, 90)
    case typ
    when BAUM
      baum(wiederholungen, BAUM_WINKEL, BAUM_LAENGE / 2 ** (wiederholungen - 1), BAUM_BREITE)
    when RANKE
      ranke(wiederholungen, RANKE_WINKEL, RANKE_LAENGE / 2 ** (wiederholungen), RANKE_BREITE)
    else
      puts "Typ nicht bekannt"
    end
  end


  # F-> C0FF-[C1-F+F+F]+[C2+F-F-F]
  # Dabei sind C0,C1,C2 Anweisungen an die Turtle, um die Farbe zu wechseln

  def baum(n, winkel, laenge, breite)
    if n == 0
      @turtle.go_ahead(laenge)
      return
    end
    @turtle.change_color(C0)
    baum(n - 1, winkel, laenge, breite)
    baum(n - 1, winkel, laenge, breite)
    @turtle.turn_right(winkel)

    @turtle.remember
    @turtle.change_color(C1)
    @turtle.turn_right(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.turn_left(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.turn_left(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.restore

    @turtle.turn_left(winkel)

    @turtle.remember
    @turtle.change_color(C2)
    @turtle.turn_left(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.turn_right(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.turn_right(winkel)
    baum(n - 1, winkel, laenge, breite)
    @turtle.restore

    # rekursion             # F
    # linksdrehung          # +
    # rechtsdrehung         # -
  end

  # F-> C0FF[C1-F++F][C2+F--F]C3++F--F
  # Dabei sind C0-C3 Anweisungen an die Turtle, um die Farbe zu wechseln
  def ranke(n, winkel, laenge, breite)
    if n == 0
      @turtle.go_ahead(laenge)
      return
    end
    @turtle.change_color(C0)
    ranke(n - 1, winkel, laenge, breite)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.remember
    @turtle.change_color(C1)
    @turtle.turn_right(winkel)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.restore
    @turtle.remember
    @turtle.change_color(C2)
    @turtle.turn_left(winkel)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.restore
    @turtle.change_color(C3)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    ranke(n - 1, winkel, laenge, breite)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    ranke(n - 1, winkel, laenge, breite)

  end

  def loeschen()
    @turtle.loeschen()
  end

end