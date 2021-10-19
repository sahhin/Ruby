require "./vektor"
require './matrix'

srand(17999)
m1 = Matrix.new(3,4)
ary = Array.new(5){|row| Array.new(rand(1..7)){|col| (row+col)*rand(2..7)}}.shuffle
puts "m1=Matrix.new(3,4)"
puts "m1\n#{m1}"
puts "m1.kopiere_aus_array(#{ary})"
m1.kopiere_aus_array(ary)
puts "m1:\n#{m1}"
puts "m3=Matrix.new(4,5)"
m3 = Matrix.new( 4,5)
ary3 = Array.new(4){Array.new(5){rand(3)}}
m3.kopiere_aus_array(ary3)
puts "m3\n#{m3}"
puts "m3.kopiere_aus_array(#{ary3})"
puts "m3\n#{m3}"
puts "vektor1_2=m1.zeilen_vektor(2):#{vektor1_2=m1.zeilen_vektor(2)}"
puts "vektor3_3=m3.spalten_vektor(3):#{vektor3_3=m3.spalten_vektor(3)}"
puts "vektor1_2.skalar_produkt(vektor3_3):#{vektor1_2.skalar_produkt(vektor3_3)}"
puts "m1.mat_mult(m3):\n#{m1.mat_mult(m3)}"
