require './datum'
require './dauer'
# Die Klasse repräsentiert die Termine des Terminkalenders
# Termine setzen sich aus Beschreibung, Datum und Dauer zusammen
#
class Termin
  attr_reader :datum, :beschreibung, :dauer
  def initialize(beschreibung,datum, dauer)
    @beschreibung = beschreibung
    @datum = datum
    @dauer = dauer
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return[@datum, @dauer,@beschreibung] == [other.datum, other.dauer,other.beschreibung]

  end

  def to_s()
    "#{datum} #{beschreibung} (#{dauer.minuten()} Min)"
  end
end