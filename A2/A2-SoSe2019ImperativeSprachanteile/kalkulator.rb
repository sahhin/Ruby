class Kalkulator

  #FERTIG
  def sum_kubik(n)
    summe = 0
    i = 1
    if n > 0
      for i in (1..n)
        summe = summe + i ** 3
      end
    # else
    #   puts "Fehler: Bitte n größer 0 eingeben"
    end
    return summe
  end

  def fak(upper, lower = 1)
    summe = 1

    if (upper >= 0)
      #until lower - 1 == upper
       for i in (lower..upper)
        summe = summe * i
      end
    else
     return -1
    end
    return summe
  end

#FERTIG
  def fak_start(start, n)
    return fak(n,start)
  end

# FERTIG
  def binom(n, k)

    if (n > 0 && k > 0)
      binom_n_k = fak(n) / (fak(k) * fak(n - k))
    else
     return -1
    end

    return binom_n_k
  end

# FERTIG
  def reihe_sin(x, n)
    # n definiert die Anzahl von Gliedern
    # es wird über i summiert bis n
    sin_x = 0

   for i in (0..n)

      faktor = 2.0 * i + 1
      zaehler = (x ** faktor)
      nenner = fak(faktor)
      sin_x = sin_x + (-1) ** i * (zaehler / nenner)
   end

    return sin_x
  end


# TODO
  def n_fuer_fehler_kleiner(x, eps)
    z = 0
    f = (reihe_sin(x, 0) - Math.sin(x)).abs
    until f <= eps
      z += 1
      f = (reihe_sin(x, z) - Math.sin(x)).abs
    end

    return z
  end

end

k = Kalkulator.new()

# puts k.reihe_sin(6.28,50)
# puts Math::sin(6.28)

# puts k.fak(5,2)
# puts k.fak(5)
# puts k.fak_start(3,5)
# puts k.fak_start(4,5)
# puts k.binom(5,2)
# puts k.binom(8,3)
# puts z = Time.now.hour * 3600 + Time.now.min*60 + Time.now.sec
# puts Time.now.sec
# puts z % 60
# puts (z / 3600)%24

# puts k.reihe_sin(5, 10)
#
# puts (Math.sin(5.0))
#
# puts k.n_fuer_fehler_kleiner(3.12, 1.2e-6)
#
# puts k.reihe_sin(3.12,9)
#
# puts (Math.sin(3.12)- k.reihe_sin(3.12,8)).abs
