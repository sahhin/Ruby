require "./Kalkulator"
require "./Leser"
require "./Schreiber"

class KalkulatorDialog


  def initialize(stop_wort)
    @stop_wort = stop_wort
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

  end

  # TODO Lesen, auswerten und schreiben für eine Eingabe
  def auswerten(leser,schreiber,kalkulator)
  end

  # TODO
  def normalisiere(wort)

  end

end

