require './matrix'

srand(17999)
m1 = Matrix.new(3,4)
m2 = Matrix.new( 3,4)
ary = Array.new(5){|row| Array.new(rand(1..7)){|col| (row+col)*rand(2..7)}}.shuffle
puts "m1=Matrix.new(3,4)"
puts "m1\n#{m1}"
puts "m1.kopiere_aus_array(#{ary})"
m1.kopiere_aus_array(ary)
puts "m1:\n#{m1}"
puts "m1 zeilen:#{m1.zeilen} spalten:#{m1.spalten}"
puts "m1 #{m1.kopiere_in_array()}"
puts "zwei_dim?(#{ary}):#{m1.zwei_dim?(ary)}"
m2.kopiere_aus_array(ary.shuffle.shuffle)
puts "m2\n#{m2}"
puts "m1+m2:\n#{m1.+(m2)}"
puts "m1-m2:\n#{m1-m2}"
puts "m1*2\n#{m1*2}"
puts "m1.laengstes_element():#{m1.laengstes_element}"
puts "m1.setze_element(1,1,99999)"
m1.setze_element(1,1,99999)
puts "m1\n#{m1}"
puts "m1.laengstes_element():#{m1.laengstes_element}"
#puts "m1.lese_element(1,1):#{m1.lese_element(1,1)}"

