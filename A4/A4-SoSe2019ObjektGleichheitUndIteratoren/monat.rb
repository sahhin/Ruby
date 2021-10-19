# Die Klasse repräsentiert Monats-Objekte als Kombination aus Monats- und Jahreszahl
class Monat

  include Comparable
  # Wenn Monat Comparable inkludiert und <=> implementiert, dann können Monatsobjekte mit <,<= etc. verglichen werden

  attr_reader :time

  def initialize(monat,jahr)
     @time = Time.new(jahr,monat)
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return (self.time.eql?(other.time))
  end

  def hash
    return @time.hash
  end

  def <=>(other)
    return  @time <=> other.time
  end

  def to_s()
    @time.strftime("%m.%Y")
  end

end