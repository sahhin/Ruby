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

    case leser.kommando
    when "1"
      puts "Bitte Operand für Kubikrechnung eingeben:"
      leser.lese
      puts kalkulator.sum_kubik(leser.konvertiere_in_ganze_zahl(leser.kommando))
    when "2"
      puts "Bitte Operand für die Fakultät geben"
      leser.lese
      puts kalkulator.fak(leser.konvertiere_in_ganze_zahl(leser.kommando),1)
    when "3"
      puts "Bitte Operand für Binomialkoeffizienten geben. Erstmal n"
      leser.lese
      n = leser.kommando
      puts "Bitte jetzt k"
      leser.lese
      k = leser.kommando
      puts kalkulator.binom(leser.konvertiere_in_ganze_zahl(n), leser.konvertiere_in_ganze_zahl(k))
    when "4"
      puts "Bitte einen Winkel x in Rad eingeben"
      leser.lese
      x = leser.kommando
      puts "Bitte einen Platzhalter n für eine pos. eingeben"
      leser.lese
      n = leser.kommando
      puts kalkulator.reihe_sin(leser.konvertiere_in_zahl(x), leser.konvertiere_in_ganze_zahl(n))
    when "5"
      puts "Bitte Platzhalter x für eine Zahl eingeben"
      leser.lese
      x = leser.kommando
      puts "Bitte Platzhalter eps für eine pos Zahl << 1 eingeben"
      leser.lese
      eps = leser.kommando
      puts "Ergebnis: #{kalkulator.n_fuer_fehler_kleiner(leser.konvertiere_in_zahl(x), leser.konvertiere_in_zahl(eps))}"
    
    end

  end

  # TODO
  def normalisiere(wort)
    return wort.strip().downcase()
  end
  end


calc = KalkulatorDialog.new("bye").starten
