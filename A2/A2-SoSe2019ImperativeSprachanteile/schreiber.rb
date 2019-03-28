class Schreiber

  # Ausgabe einer Fehlermeldung
  def fehler_meldung_ausgeben()
    puts "Fehler in der Eingabe."
  end

  # Ausgabe des Methodenergebnisses mit Methodenname und Argumenten
  # *args erlaubt eine beliebige Anzahl an Argumenten, die durch Komma getrennt aufgezählt werden
  def ergebnis_ausgeben(methode,ergebnis, *args)
    puts "#{methode}(#{args.join(",")})=#{ergebnis}"
  end
end