require "./Turtle"
class GosperKurve

  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    winkel = 60
    faktor = Math.sqrt(7)
    gosper(n, winkel, faktor, kl)
  end

  def loeschen()
    @turtle.loeschen()
  end

  def gosper(n,winkel,faktor,kl)
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_right(winkel)
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_left(winkel)
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    gosper(n-1,winkel,faktor, kl/faktor)
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_left(winkel)
    gosper(n-1,winkel,faktor, kl/faktor)
    @turtle.turn_right(winkel)

    # koch(n-1,(kl/@factor).round)             # F
    # @turtle.turn_left(@angle)                # +
    # @turtle.turn_right(@angle)               # -

  end


end