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



# TODO
  def reihe_sin(x, n)
    
    zaehler = (x**(2*n+1))
    nenner = fak_start(1,(2*n + 1))
    sin_x = (-1**n) *



  end

# TODO
  def reihe_sin_opt(x, n)

  end

# TODO
  def n_fuer_fehler_kleiner(x, eps)

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

