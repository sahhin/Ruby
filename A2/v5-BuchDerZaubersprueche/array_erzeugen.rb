
# Erzeugen mit Literalen

ary = [1,2,3,4]

# Erzeugen mit Block

ary = Array.new(4){|zeile| zeile+1}
puts ary.to_s()