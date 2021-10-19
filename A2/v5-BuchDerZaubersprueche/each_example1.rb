str_d = ""
str_nd = ""
["n1","n2","n3","n4"].each(){|element|
  puts element
  str_d<<element
  str_nd+element
}

puts str_d
puts "str_nd=#{str_nd}"