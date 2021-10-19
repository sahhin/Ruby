def alle_vielfache_von?(ary, n)


  # Über ary iterieren und prüfen, ob Element aus ary modulo n != 0 ist
  ary.each do |elem|
    return false if elem % n != 0
  end
  return true
end

def sammle_strings_der_laenge(ary, n)
  ary_n = []

  # Über ary iterieren und prüfen, ob Element aus ary == n ist. Falls ja, in neues Array pushen
  ary.each do |elem|
    ary_n << elem if elem.size == n
  end

  return ary_n
end

def casecmp(ary1, ary2)
  ary_cmp = 0
  (0...[ary1.size, ary2.size].min()).each do |i|
    ary_cmp = ary1[i].downcase <=> ary2[i].downcase
    if ary_cmp != 0
      return ary_cmp
    end
  end
  if ary_cmp == 0
    return ary1.size <=> ary2.size
  end

  return ary_cmp #
end


def sechs_aus_49()
  erg = []
  zahlen = Array(1..49)
  ziehung = 6

  # aus Zahlen Array an Stelle Zufallszahl in Ergebnis Array pushen
  # Zahlen-Array minus Ergebnis-Array. Für jeden Durchlauf wird ein neues Element gelöscht.
  ziehung.times do
    erg << zahlen[rand(0...zahlen.size)]
    zahlen -= erg
  end

  return erg
end

def shuffle(ary)

  zufall = []

  # Elemente aus Array ary löschen, damit keine mehrfachen Einträge vorkommen
  until ary.empty?
    zufall << ary.delete_at(rand(ary.size))
  end

  return zufall

end

