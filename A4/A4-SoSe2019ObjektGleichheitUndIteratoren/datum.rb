require "./dauer"

# Die Klasse repräsentiert eine Zeiteinheit, die aus Datumsangabe und Stunde sowie Minute besteht
class Datum
  # Wenn Datum Comparable inkludiert und <=> implementiert, dann können Datumsobjekte mit <,<= etc. verglichen werden
  include Comparable
  def <=> other
    return @time <=> other.time
  end

  attr_reader :time

  def initialize(tag,monat,jahr,stunde,minute)
     @time  = Time.new(jahr,monat,tag,stunde,minute)
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return @time == other.time
  end

  # Addiert die Dauer auf das Datums-Objekt
  def +(dauer)
    # + von Time erwartet eine Zeitangabe in Sekunden
    new_time = @time+dauer.in_sekunden()
    return Datum.new(new_time.day,new_time.month,new_time.year,new_time.hour,new_time.min)
  end

  # Gibt den Monat des Datums zurück
  def monat_im_jahr()
    return Monat.new(@time.month,@time.year)
  end

  # Gibt den Tag des Datums zurück
  def tag_im_monat()
    return Tag.new(@time.day,@time.month,@time.year)
  end

  def to_s()
    return @time.strftime "%d.%m.%Y %H:%M"
  end
end




