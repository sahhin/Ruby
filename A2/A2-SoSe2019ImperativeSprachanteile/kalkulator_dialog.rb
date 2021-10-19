require "./Kalkulator"
require "./Leser"
require "./Schreiber"

class KalkulatorDialog
  def initialize(stop_wort)
    @stop_wort = normalisiere(stop_wort)
    @instruktion = "Willkommen in unserem Rechenzentrum für mathematische Formeln:\nMachen Sie eine der folgenden Eingaben.\n"+
        "1 n: um die Summe der ersten Kubikzahlen zu berechnen.  \n" +
        "2 n: um die Fakultät zu berechnen. n ist Platzhalter für eine pos. ganze Zahl.\n" +
        "3 n k: um den Binomialkoeffizienten zu berechnen. n und k sind Platzhalter für eine pos. ganze Zahl.\n" +
        "4 x n: um die Näherung für sin(x) zu berechen. x ist Platzhalter für eine Zahl, n Platzhalter für eine pos. ganze Zahl.\n" +
        "5 x f: um die Anzahl der  Iterationen zu berechnen für die der Fehler der Näherung für sin(x) kleiner als ein gegebenes positives Epsilon << 1 wird.\n" +
          "       x ist Platzhalter für eine Zahl, f Platzhalter für eine pos Zahl << 1\n"+
                                       "Geben Sie #{@stop_wort} ein, um den Dialog zu beenden.\n"

  end

  # TODO Lese-Auswerte-Schreibe Schleife
  def starten()
    leser      = Leser.new()
    schreiber  = Schreiber.new()
    kalkulator = Kalkulator.new()

    while leser.kommando != @stop_wort
    puts @instruktion
    leser.lese
    auswerten(leser, schreiber, kalkulator)
    end

  end

  # TODO Lesen, auswerten und schreiben für eine Eingabe
  def auswerten(leser,schreiber,kalkulator)

    if leser.ganze_zahl?(leser.kommando)

    case leser.kommando
    when "1"
     # puts kalkulator.sum_kubik(leser.konvertiere_in_ganze_zahl(leser.argument(1)))
     if leser.ganze_zahl?(leser.argument(1))
      schreiber.ergebnis_ausgeben("summe_kubik", kalkulator.sum_kubik(leser.konvertiere_in_ganze_zahl(leser.argument(1))), leser.argument(1))
     else
       schreiber.fehler_meldung_ausgeben
     end

    when "2"
      #puts kalkulator.fak(leser.konvertiere_in_ganze_zahl(leser.argument(1)))
      if leser.ganze_zahl?(leser.argument(1))
      schreiber.ergebnis_ausgeben("fakultät", kalkulator.fak(leser.konvertiere_in_ganze_zahl(leser.argument(1))), leser.argument(1))
      else
        schreiber.fehler_meldung_ausgeben
      end
    when "3"
      #puts kalkulator.binom(leser.konvertiere_in_ganze_zahl(leser.argument(1)), leser.konvertiere_in_ganze_zahl(leser.argument(2)))
      if (leser.ganze_zahl?(leser.argument(1))) && (leser.ganze_zahl?(leser.argument(2)))
      schreiber.ergebnis_ausgeben("binom", kalkulator.binom(leser.konvertiere_in_ganze_zahl(leser.argument(1)), leser.konvertiere_in_ganze_zahl(leser.argument(2))), leser.argument(1), leser.argument(2))
      else
        schreiber.fehler_meldung_ausgeben
      end
    when "4"
     #puts kalkulator.reihe_sin(leser.konvertiere_in_zahl(leser.argument(1)), leser.konvertiere_in_ganze_zahl(leser.argumen(2)))
      if (leser.zahl?(leser.argument(1))) && (leser.zahl?(leser.argument(2)))
      schreiber.ergebnis_ausgeben(:reihe_sin, kalkulator.reihe_sin(leser.konvertiere_in_zahl(leser.argument(1)), leser.konvertiere_in_ganze_zahl(leser.argument(2))), leser.argument(1), leser.argument(2))
      else
        schreiber.fehler_meldung_ausgeben
        end
    when "5"
      #puts "Ergebnis: #{kalkulator.n_fuer_fehler_kleiner(leser.konvertiere_in_zahl(leser.argument(1)), leser.konvertiere_in_zahl(leser.argument(2)))}"
      if (leser.zahl?(leser.argument(1))) && (leser.zahl?(leser.argument(2)))
        schreiber.ergebnis_ausgeben("n_fuer_fehler_kleiner", kalkulator.n_fuer_fehler_kleiner(leser.konvertiere_in_zahl(leser.argument(1)), leser.konvertiere_in_zahl(leser.argument(2))), leser.argument(1), leser.argument(2))
      else
        schreiber.fehler_meldung_ausgeben
        end
    end
    else
      schreiber.fehler_meldung_ausgeben
    end
    return leser.eingabe()
  end

  # TODO
  def normalisiere(wort)
    return wort.strip().downcase()
  end
  end


calc = KalkulatorDialog.new("bye").starten
