instances()
ary1=["n1","n2","n3","n4"]
ary2=["x1","x2","x3","x4"]

ary1.each(){|e1|
  ary2.each() {|e2|
    puts "(e1=#{e1},e2=#{e2})"
  }
}

def arrays_vergleichen(ary1,ary2)
  for i in (0...ary1.size())
    if !(ary1[i] == ary2[i])
      return false
    end
  end
  return true
end