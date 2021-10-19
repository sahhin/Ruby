def g_it(n)
  speicher = 0
  return -1 if n < 0 #nicht definiert
  for i in (1..n)
    speicher = speicher + 1.0 / (i * (i + 1)) # Rekursionsschritt
  end
  return speicher
end

def g_rek(n)
  return -1 if n < 0 #nicht definiert
  _g_rek(n)
end

def _g_rek(n)
  return 0 if n == 0 #Terminierungsbedingung
  return g_rek(n - 1) + 1.0 / (n * (n + 1)) #Rekursionsschritt
end

private :_g_rek #Methode ausgelagert, um n==0 zu umgehen. n kann sonst mit 0 mitgegeben werden, darf aber 0 sein

def g_rek_sp(n)
  return -1 if n < 1  #nicht definiert
  return _g_rek_sp(n,0)
end

def _g_rek_sp(n,sp)
  return sp if n == 0 #Terminierungsbedingung
  return _g_rek_sp(n - 1, sp + 1.0 / (n * (n + 1))) # Rekursionsschritt
end

def ln_halbe_it(x, n)
  speicher = 0
  return -1 if x < 0
  for i in (0..n)
    speicher = speicher + (x - 1.0) ** (2 * i + 1) / ((2 * i + 1) * (x + 1) ** (2 * i + 1))
  end
  return speicher
end

def ln_halbe_rek(x, n)
  return -1 if x < 0
  return (x - 1.0) / (x + 1) if n == 0
  return ln_halbe_rek(x, n - 1) + (x - 1.0) ** (2 * n + 1) / ((2 * n + 1) * (x + 1) ** (2 * n + 1))
end

def ln_halbe_rek_sp(x, n)
  return -1 if n < 0
  return -1 if x < 0
  return _ln_halbe_rek_sp(x, n,0)
end

def _ln_halbe_rek_sp(x, n, sp)
  return sp  if n < 0
  return _ln_halbe_rek_sp(x, n - 1, sp + (x - 1.0) ** (2 * n + 1) / ((2 * n + 1) * (x + 1) ** (2 * n + 1)))
end
private :_ln_halbe_rek_sp

def palindrom?(zeichenkette)
  # normalisiere und entferne Leerzeichen
  norm = normalisiere(zeichenkette)
  _palindrom?(norm)
end

def palindrom_sp?(zeichenkette)
  # normalisiere und entferne Leerzeichen
  norm = normalisiere(zeichenkette)
  _palindrom_sp?(norm)
end

def normalisiere(zk)
  zk.downcase().delete(" \\',.?\\-\"\n")
end

def _palindrom?(zeichenkette)
  return true if zeichenkette.size <= 1
  return zeichenkette[0, 1] == zeichenkette[-1, 1] && _palindrom?(zeichenkette[1..-2])
end


def _palindrom_sp?(zeichenkette, sp = true)
  return true if zeichenkette.size <= 1
  return _palindrom_sp?(zeichenkette[1..-2], sp && zeichenkette[0, 1] == zeichenkette[-1, 1])
end


