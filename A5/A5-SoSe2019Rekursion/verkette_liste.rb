require_relative "./Knoten"

class VerketteListe
  include Enumerable

  def initialize()
    @start = nil
  end

  def empty?()
    @start.nil?
  end


  def <<(inhalt)
    if empty?
      @start = Knoten.new(inhalt)
    else
      @start<<inhalt

    end
  end

  def each(&block)
    if @start.nil?
      return self
    else
      @start.each(&block)
    end
  end

  # Gegeben
  def to_s()
    "["+ to_a().join(",") +"]"
  end
end

vl = VerketteListe.new()
puts vl
vl<<1
vl<<3
vl<<7
vl<<9

puts vl.to_s
