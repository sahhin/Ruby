def max_width(ary)
  max = ary.size

  ary.each() do |elem|
    if elem.is_a?(Array)
      laenge = elem.size
      max = [max, max_width(elem)].max
    #else
      #max = [max, laenge].max
    end
  end
  return max
end

# IST ZWAR EINE LÖSUNG, ABER SEHR UNEFFIZIENT UND "ABENTEUERLICH"
#
# def helper_deep_group_by_type(ary, type_hash = Hash.new {|k, v| k[v] = []})
#   ary.each() do |elem|
#     if elem.is_a?(Array)
#       type_hash[elem.class] << elem
#       helper_deep_group_by_type(elem, type_hash)
#     else
#       type_hash[elem.class] << elem
#     end
#   end
#   return type_hash
# end
#
# def deep_count_elems_with_ary(arr, res=[])
#   sum=0
#   hash = helper_deep_group_by_type(arr)
#   hash.each_value {|x| sum+=x.size.to_i }
#   res << [sum, arr]
#
#   arr.each do |elem|
#     if elem.is_a?(Array)
#       deep_count_elems_with_ary(elem, res)
#     end
#   end
#   return res
# end

def deep_count_elems_with_ary(ary)
  result =[[ary.size(),ary]]
  ary.each() do |elem|
    if elem.is_a?(Array)
      elem_count  = deep_count_elems_with_ary(elem) # [[elem_deep_ct,elem], ...]
      result[0][0] += elem_count[0][0]
      result += elem_count
    end
  end
  return result
end

def deep_group_by_type(ary, type_hash={})
  ary.each() do |elem|
    if elem.is_a?(Array)
      deep_group_by_type(elem, type_hash)
    else
       if !type_hash.has_key?(elem.class)
         type_hash[elem.class] = []
       end
      type_hash[elem.class] << elem
    end
  end
  return type_hash
end


def deep_reverse(a_hash)
  sp = {  }
  a_hash.each do |k, v|
    _k = k
    _v = v
    if k.is_a?(Hash)
      _k = deep_reverse(k)
    end
    if v.is_a?(Hash)
      _v = deep_reverse(v)
    end
    sp[_v] = _k
  end
  return sp
end

# def deep_reverse(a_hash, sp = {})
#   a_hash.each_with_object({}) do |(k, v), rev_hash|
#     if k.is_a?(Hash)
#       k = deep_reverse(k)
#     elsif v.is_a?(Hash)
#       v = deep_reverse(v)
#     end
#     rev_hash[v] = k
#   end
#
# end




