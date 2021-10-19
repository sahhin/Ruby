class HilbertKurve
  # NICHT ANFASSEN
  # die Methode, die die rekursive Vorschrift zur Konstruktion der Hilbertkurve umsetzt
  # wdhl: gibt den Grad der Kurve an
  # x,y: Startposition für den Zeichenstift
  # kl: Ausgangslänge der Kante
  def zeichnen(wdhl,x,y,kl)
    # Turtle ist eine Zeichenwerkzeug, das zu Beginn auf Position x,y gesetzt wird
    width = Leinwand.gib_einzige_instanz().width()
    height = Leinwand.gib_einzige_instanz().height()
    #x = width/2
    #y = 500
    #kl = 400
    # Turtle ist eine Zeichenwerkzeug, das zu Beginn auf Position x,y gesetzt wird
    @turtle = Turtle.new(x,y)
    _zeichnen(wdhl,kl)
  end

  # NICHT ANFASSEN
  def loeschen()
    @turtle.loeschen()
  end

  # Vorschrift:
  # X, X -> -Y F + X F X + F Y-  (- = rechts + = links)
  # Y -> + X F - Y F Y - F X +
  def _zeichnen(n,kl)

  end

end