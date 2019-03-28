class Leser

  def initialize()
    @eingabe =[]
  end

  # liest und zerlegt die Eingabe in einzelne Zeichenketten
  def lese()
    @eingabe = gets.chomp().strip().split()
    return self
  end

  # gibt den Zahl für die Kommandoauswahl als Zeichenkette zurück
  def kommando
    return @eingabe[0].nil?()?nil :@eingabe[0].strip()
  end

  # gibt das n'te Argument der Eingabe als Zeichenkette zurück
  def argument(n)
    return @eingabe[n].nil?()? nil: @eingabe[n].strip()
  end

  # gibt die Eingabe zurück
  def eingabe()
    return @eingabe.join(" ")
  end


  # prüft ob wort (eine Zeichenkette) in eine Gleitkommazahl gewandelt werden kann
  # gibt true oder false zurück
  def zahl?(wort)
    begin
      Float(wort)
    rescue ArgumentError,TypeError
      return false
    end
    return true
  end

  # TODO prüft ob wort (eine Zeichenkette) in eine ganze Zahl gewandelt werden kann
  def ganze_zahl?(wort)
  end

  # TODO wandelt wort in eine ganze Zahl
  def konvertiere_in_ganze_zahl(wort)

  end

  # TODO wandelt wort in eine ganze Zahl, wenn wort eine ganze Zahl enthält sonst in eine Gleitkommazahl
  def konvertiere_in_zahl(wort)
  end

end