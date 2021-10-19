# Die Klasse für den Terminkalender
class TerminKalender
  include Enumerable

  def initialize(besitzer)
    @besitzer = besitzer
    @termine = []
  end

  def each(&block)
    @termine.each(&block)
  end

  def each(&block)
    @termine.each(){|termin| block.call(termin)}
  end

  def each()
    @termine.each(){|termin| yield(termin)}
  end

  # Trägt einen neuen Termin in den Terminkalender ein. Dabei wird sicher gestellt, dass sich keine Termine überschneiden.
  # Neue Termine, die in Konflikt mit bestehenden Terminen stehen, werden abgewiesen.
  # Die Methode gibt true zurück, wenn das Eintragen erfolgt ist, sonst false.
  # Wenn der Termin nicht eingetragen werden kann, gibt die Methode einen Hinweis auf der Konsole aus, der auch den Termin enthält,
  # mit dem der Konflikt auftritt.
  def << neuer_termin
    letzter_termin_vor_neuem = @termine.find_all() {|termin| termin.datum < neuer_termin.datum()}.max_by() {|termin| termin.datum}
    erster_termin_nach_neuem = @termine.find() {|termin| termin.datum > neuer_termin.datum}

    if @termine.empty?
      @termine << neuer_termin
      return true
    elsif erster_termin_nach_neuem.nil?
      # Es gibt keinen Termin der nach dem neuen Termin liegt
      # Jetzt muss grüft werden, ob der neue Termin nach letzter_termin_vor_neuem zzgl. der Dauer liegt
      if passt_nach?(neuer_termin, letzter_termin_vor_neuem)
        @termine << neuer_termin
        return true
      else
        puts "#{neuer_termin} passt nicht nach #{letzter_termin_vor_neuem}"
        return false
      end
    elsif letzter_termin_vor_neuem.nil?
      # Termin wird vorne in @termine eingefügt, da es keinen früheren Termin gibt
      # Jetzt muss geprüft werden, ob es keine Terminüberschneidungen gibt
      # Also ob das der neue Termin plus Dauer vor den ersten_termin_nach_neuem liegt
      if passt_vor?(neuer_termin, erster_termin_nach_neuem)
        # Dann kann der Termin vorne eingefügt werden
        @termine.unshift(neuer_termin)
        return true
      else
        puts "#{neuer_termin} passt nicht vor #{erster_termin_nach_neuem}"
        return false
      end
    else
      # In diesem Fall muss der neue Termin zwischen zwei bestehenden Terminen eingefügt werden
      if passt_nach?(neuer_termin, letzter_termin_vor_neuem) && passt_vor?(neuer_termin, erster_termin_nach_neuem)
        index = @termine.index(erster_termin_nach_neuem)
        @termine.insert(index, neuer_termin)
        return true
      else
        puts "#{neuer_termin} passt nicht zwischen #{letzter_termin_vor_neuem} und #{erster_termin_nach_neuem}"
        return false
      end
    end
  end

  # Löscht einen Termin aus dem Terminkalender
  def delete(termin)
    @termine.delete(termin)
  end

  def passt_nach?(termin, termin_vor)
    return (termin_vor.datum() + termin_vor.dauer()) <= termin.datum
  end

  def passt_vor?(termin, termin_nach)
    return termin.datum() + termin.dauer() <= termin_nach.datum()
  end

  # Interne Methoden, die von außen nicht aufgerufen werden können
  private :passt_nach?, :passt_vor?

end


