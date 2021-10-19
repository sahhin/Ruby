class SpielUtility

  private_class_method :new

  NORDEN = "north"
  SUEDEN = "south"
  WESTEN = "west"
  OSTEN = "east"
  @@richtungen = [NORDEN, OSTEN, SUEDEN, WESTEN]


  def self.restliche_richtungen(richtung)
    restliche_richtungen = @@richtungen.clone()
    restliche_richtungen.delete(richtung)
    return restliche_richtungen
  end

  def self.inverse_richtung(richtung)
    @@richtungen[(@@richtungen.index(richtung) + 2) % 4]
  end

end

