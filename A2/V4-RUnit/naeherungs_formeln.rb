
def ln(x,n)
  if x <= 0.5 || n < 1
    return -1
  end
  sum = 0
  for i in(1..n)
    sum += (x-1.0)**i/(i*x**i)
  end
  return sum
end