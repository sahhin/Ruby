
a = Array.new(4){Array.new(3)}
puts a.to_s()

b = Array.new(4){|i| Array.new(i)}
puts b.to_s()

c = Array.new(4){Array.new(3,8)}
puts c.to_s()

d = Array.new(2){|i| Array.new(3) {|j| i+j}}
puts d.to_s()

e = Array.new(3, Array.new(3,8))
puts e.to_s()

e[0][1] = 7
puts e.to_s()