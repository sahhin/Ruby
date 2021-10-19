# Die Klasse repräsentiert Tag-Objekte als Kombination aus Tag-, Monats- und Jahreszahl
class Tag
  include Comparable
  # Wenn Tag Comparable inkludiert und <=> implementiert, dann können Tagobjekte mit <,<= etc. verglichen werden
  attr_reader :time

  def initialize(tag,monat,jahr)
    @time = Time.new(jahr,monat,tag)
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

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return @time == other.time

  end

  # def <=>(other)
  #   return  @time <=> other.time
  # end

  def to_s()
    @time.strftime("%d.%m.%Y")
  end
end

