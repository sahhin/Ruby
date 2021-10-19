class Anonymous

  attr_reader :one, :two
  protected :one, :two

  def initialize(one,two)
    @one = one
    @two = two
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return @one == other.one
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    return [@one,@two].eql?([other.one,other.two])
  end

  def hash()
      return [@one].hash()
  end
end

one = Anonymous.new("ich","eins")
two = Anonymous.new("ich", "eins")

# obj = Object.new()
#
# puts obj==one
# puts one==obj

puts one.eql?(two)
puts one.hash()
puts two.hash()

require 'Set'

set = Set.new()
set<<one
set << two
p set