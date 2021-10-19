class Knoten

  def initialize(inhalt)
    @inhalt = inhalt
    @nachfolger = nil
  end

  def << (inhalt)
    if @nachfolger.nil?
        @nachfolger = Knoten.new(inhalt)
    else
      @nachfolger << inhalt
    end
  end

  def each(&b)
  b.call(@inhalt)
    if @nachfolger.nil?
      @nachfolger.each(&b)
    end
  end

  def to_s()
    return @inhalt.to_s()
  end

end
