class Uhr

  # TODO
  def initialize(hour=nil, minute=nil, sec=nil)
    sekunden = 0
    if ((hour != nil) && (minute != nil) && (sec != nil))
      if ganze_zahl?(hour) && ganze_zahl?(minute) && ganze_zahl?(sec)
      # hour *= 3600
      # minute *= 60
      # sekunden = sec
        sekunden = hour*3600 + minute*60 + sec
      else
        sekunden = Integer(hour) * 3600 + Integer(minute) * 60 + Integer(sec)
      end
    else
      now  = Time.now()
      sekunden = now.hour * 3600 + now.min * 60 + now.sec
      # minute = Time.now.min * 60
      # sekunden = Time.now.sec
    end

    # Instanz der Uhrzeit-Klasse
    @uhrzeit = Uhrzeit.new(sekunden)

  end

  def ganze_zahl?(zahl)
    return zahl.integer?
  end

  # TODO
  def tick()
    @uhrzeit + 1
  end

  # TODO
  def to_s()
    return @uhrzeit.to_s
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
    @sekunden = sekunden
  end
  # TODO
  #
  attr_reader :sekunden
  def +(sek)
    @sekunden += sek
  end
  # TODO
  def sekunden_anteil()
    return @sekunden % 60
  end
  # TODO

  def minuten_anteil()
   return (@sekunden/60)%60
  end

  # TODO
  def stunden_anteil()
    return (@sekunden / 3600) % 24
  end
  # TODO
  def to_s()
    return "#{stunden_anteil.to_s().rjust(2,"0")}:#{minuten_anteil.to_s().rjust(2,"0")}:#{sekunden_anteil.to_s().rjust(2,"0")}"
  end
end

uhr = Uhr.new()
puts uhr.to_s




