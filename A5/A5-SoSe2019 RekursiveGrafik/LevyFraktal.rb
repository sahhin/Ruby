class LevyFraktal
=begin
  Lévy fractal, aka C-curve
  w = F
  P = F → +F--F+
  δ = 45°
  Verkürzung = 1 / √2
=end

  def loeschen()
    @turtle.loeschen()
  end

  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    winkel = 45
    faktor = 1/Math.sqrt(2)
    levy(n,winkel,faktor,kl)
  end

    #P = F → +F--F+
  def levy(n,winkel,faktor,kl)
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    @turtle.turn_left(winkel)
    levy(n-1,winkel,faktor, kl*faktor)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    levy(n-1,winkel,faktor, kl*faktor)
    @turtle.turn_left(winkel)

      # koch(n-1,(kl/@factor).round)             # F
    # @turtle.turn_left(@angle)                # +
    # koch(n-1,(kl/@factor).round)             # F
    # @turtle.turn_right(@angle)               # -
    # @turtle.turn_right(@angle)               # -
    # koch(n-1,(kl/@factor).round)             # F
    # @turtle.turn_left(@angle)                # +
    # koch(n-1,(kl/@factor).round)             # F


  end

end