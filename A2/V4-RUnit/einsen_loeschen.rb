z = "311171811"

i=0

while i < z.length()
  if z[i] == "1"
    z.slice!(i)
  end
  i+=1
end

p z