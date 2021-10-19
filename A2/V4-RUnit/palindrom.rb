
def palindrom?(arg)
 
  return false if !arg.is_a?(String)
  l = arg.length()
  for i in (0...l/2)
    if arg[i].downcase() != arg[l-(i+1)].downcase()
      return false
    end
  end
  return true
end

