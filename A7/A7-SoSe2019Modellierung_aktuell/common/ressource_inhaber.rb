require_relative './ressource'
module RessourceInhaber # class oder module das müssen Sie entscheiden Teil der Aufgabe

  def aktiv?()
    return !ressource.verbraucht?()
  end

  def ressource()
    abstract()
  end

  def ressource_praefix()
    ""
  end

  protected :ressource_praefix

  def reduziere_ressource(betrag)
    ressource.reduziere(betrag)
  end

  def erhoehe_ressource(betrag)
    ressource.erhoehe(betrag)
  end

end