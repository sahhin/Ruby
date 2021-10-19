# Die Klasse repräsentiert eine Zeitspanne, die in Minuten repräsentiert wird
class Dauer
  include Comparable
  # Wenn Dauer Comparable inkludiert und <=> implementiert, dann können Dauerobjekte mit <,<= etc. verglichen werden

  attr_reader :minuten

  def initialize(minuten)
    @minuten = minuten
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return[@minuten] == [other.minuten]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return (self.minuten.eql?(other.minuten))
  end

  def hash
    return @minuten.hash
  end

  # Funktionalität wie in Aufgabe 2 Uhrzeit
  def stunden_anteil()
    return minuten/60
  end

  # Funktionalität wie in Aufgabe 2 Uhrzeit
  def minuten_anteil()
    return minuten%60
  end

  # Wird in Datum benötigt, um Datum und Dauer addieren zu können
  def in_sekunden()
    return minuten*60
  end

  # Addiert  ein Objekt von Typ Dauer auf das Dauer-Objekt self
  # Verändert self nicht
  def +(other)
    return Dauer.new(minuten+other.minuten)
  end

  def <=> (other)
    return @minuten <=> other.minuten
  end

  def to_s()
    "#{stunden_anteil().to_s().rjust(2,"0")}:#{minuten_anteil.to_s().rjust(2,"0")}"
  end
end