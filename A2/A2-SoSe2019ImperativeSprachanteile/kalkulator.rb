class Kalkulator

  #FERTIG
  def sum_kubik(n)
    summe = 0
    i = 1
    n.times() do
      summe = summe + i ** 3
      i += 1
    end
    return summe
  end



# FERTIG
  def reihe_sin(x, n)
    # n definiert die Anzahl von Gliedern
    # es wird über i summiert bis n
    i       = 0
    sin_x   = 0

    until i == n

      faktor  = 2*i + 1
      zaehler = (x**faktor)
      nenner  = fak_start(1,faktor)
      sin_x = sin_x + (-1)**i * (zaehler / nenner)

      # i wird jedes Mal 1 addiert bis i == n

      i += 1

    end




  end

# TODO
  def reihe_sin_opt(x, n)

  end

# TODO
  def n_fuer_fehler_kleiner(x, eps)
    z = 0
    until n <= eps
    n = (reihe_sin(x,z)- Math.sin(x)).abs

    z += 1

    end

    return n
    puts z

  end



#FERTIG
  def fak(upper, lower = 1)
    summe = 1
    if (upper > 0)
      until lower - 1 == upper
        summe = summe * lower
        lower += 1
      end
    else
      puts "Fehler: Obergrenze kleiner oder gleich 0"
    end
    return summe
  end


#FERTIG
  def fak_start(start, n)
    if (n > 0)
      summe = 1
      until start - 1 == n
        summe = summe * start
        start += 1
      end
    else
      puts "Fehler: Obergrenze kleiner oder gleich 0"
    end
    return summe
  end

# FERTIG
  def binom(n, k)

    binom_n_k = fak_start(1, n) / (fak_start(1, k) * fak_start(1, (n - k)))

    return binom_n_k
  end


end

