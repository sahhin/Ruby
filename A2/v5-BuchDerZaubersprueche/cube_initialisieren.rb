
breite = hoehe = tiefe = 4

cube = Array.new(breite){Array.new(hoehe){Array.new(tiefe)}}

puts cube.to_s() # Elemente sind mit nil initialisiert

# LED's erzeugen insgesamt 64
led000 = "led111"
led001 = "led112"
led333 = "led444"
led200 = "led311"
led201 =  "led312"
led202 = "led313"
led203 = "led314"
led210 = "led321"
led211 = "led322"
led212 = "led323"
led213 = "led324"
led220 = "led331"
led221 = "led332"
led222 = "led333"
led223 = "led334"
led230 = "led341"
led231 = "led342"
led232 = "led343"
led233 = "led344"
# ... etc

# cube fuellen
cube[0][0][0] = led000
cube[0][0][1] = led001
cube[3][3][3] = led333
# ... etc

puts cube.to_s()


cube[2] = [[led200,led201,led202,led203],
            [led210,led211,led212,led213],
            [led220,led221,led222,led223],
            [led230,led231,led232, led233]]

puts cube.to_s()

puts cube[2].to_s() # Ergebnis 2-dim Array

# Cube durch geschachtelte Schleifen initialisieren

for b in (0...breite)
  for h in (0...hoehe)
    for t in (0...tiefe)
      cube[b][h][t] = "led#{b+1}#{h+1}#{t+1}"
    end
  end
end

puts cube.to_s()
puts cube[2].to_s()
