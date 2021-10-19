class Node


  include Enumerable
  def initialize(ct,left=nil,right=nil)
    @ct = ct
    @left = left
    @right= right
  end

  def each(&b)
    b.call(@ct)
    if @left
      @left.each(&b)
    end
    if @right
      @right.each(&b)
    end
  end

  def to_s()
    return @ct.to_s()
  end
end

n3 = Node.new(3)
n2 = Node.new(2)
n1 = Node.new(1,n2,n3)

n1.each(){|elem| puts elem}

p n1.to_a()
p n1.inject(:+)