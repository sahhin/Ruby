class Uhr

  # TODO
  def initialize(hour, minute, sec)


  end

  # TODO
  def tick()
  end

  # TODO
  def to_s()
  end

  # Gegeben: startet die Uhr und zählt im Sekundentakt hoch
  def starten(laufzeit)
    ct = 0;
    while (ct < laufzeit)
      # Wenn die Mikrosekunden des Time-Objektes (Methode usec) == 0 sind, dann ist eine Sekunde verstrichen
      if ((Time.now() - @uhrzeit.sekunden).usec == 0)
        self.tick
        puts self
        ct += 1
      end
    end
  end
end


class Uhrzeit

  # TODO
  def initialize(sekunden)
  end
  # TODO
  def +(sekunde)
  end
  # TODO
  def sekunden_anteil()
  end
  # TODO
  def minuten_anteil()
  end
  # TODO
  def stunden_anteil()
  end
  # TODO
  def to_s()
  end
end



