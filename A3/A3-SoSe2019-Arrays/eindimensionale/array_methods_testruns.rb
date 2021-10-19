require "./arrays"
ary1 = [1,2,3,4,5,6,7]
ary3 = []
(0..20).step(3){|elem| ary3 << elem}

ary_strings_1 = %w{das ist ein Array mit vielen Strings der Laenge drei}
ary_strings_2 = %w{Das ist ein ARRAY mit vielen STRINGS der Laenge drei}
ary_strings_3 = %w{Das ist ein ARRAY mit vielen STRINGS}
ary_strings_4 = %w{Xenon}

puts "alle_vielfache_von?"
puts alle_vielfache_von?(ary1,2)
puts alle_vielfache_von?(ary3,3)

puts "sammle_strings_der_laenge"
p sammle_strings_der_laenge(ary_strings_1,3)
p sammle_strings_der_laenge(ary_strings_1,6)
p sammle_strings_der_laenge(ary_strings_1,10)
p sammle_strings_der_laenge([], 20)

puts "casecmp"
puts casecmp(ary_strings_1,ary_strings_2)
puts casecmp(ary_strings_1,ary_strings_3)
puts casecmp(ary_strings_3,ary_strings_1)
puts casecmp(ary_strings_1,ary_strings_4)

puts "sechs_aus_49"
srand(9999)
p sechs_aus_49()
p sechs_aus_49()

puts "shuffle"
p shuffle(ary1)
p shuffle(ary_strings_1)
p shuffle([])

