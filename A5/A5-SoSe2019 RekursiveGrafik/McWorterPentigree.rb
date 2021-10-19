require "./Turtle"

class McWorterPentigree

=begin
  McWorter's Pentigree
  n = 5
  axiom = F
  rule = F → +F++F----F--F++F++F-
  δ = 36°
  s = (3 - √5) / 2
  d = 1.8617...
=end

  def loeschen()
    @turtle.loeschen()
  end
  
  def zeichnen(n,x,y,kl)
    @turtle = Turtle.new(x,y)
    winkel = 36
    _zeichnen(n,winkel,kl)
  end

  # rule = F → +F++F----F--F++F++F-

  def _zeichnen(n,winkel,kl)
    if n == 0
      @turtle.go_ahead(kl)
      return
    end
    @turtle.turn_left(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_right(winkel)
    @turtle.turn_right(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_left(winkel)
    @turtle.turn_left(winkel)
    _zeichnen(n-1,winkel,kl)
    @turtle.turn_right(winkel)

  end
end