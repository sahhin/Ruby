# Optional
require './matrix'
class Vektor

  def initialize(ary)
    # Nennen Sie die Variable @intern
    @intern = Array.new(ary)

  end

  def size()
    return @intern.size()
  end

  def [](index)
    return @intern[index]
  end

  def skalar_produkt(vektor)
    check(vektor)
    produkt = 0
    for i in (0...size())
      produkt += @intern[i] * vektor[i]
    end
    return produkt
  end

  def check(vektor)
    raise ArgumentError, "Vektor #{vektor} hat nicht die gleiche Anzahl an Elementen wie #{self}" if self.size != vektor.size
  end

  def to_s(max_laenge=4)
   "(#{@intern.join(",")})"
  end
end

