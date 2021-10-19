
class Person
  attr_reader :name, :adresse
  attr_writer :name, :adresse
  #protected :name, :adresse
  def initialize(name, adresse)
    @name    = name
    @adresse = adresse
  end

  def name
    return @name.clone
  end

  def to_s()
    puts "P{#@name}-{#@adresse}"
  end
end
class Adresse
  attr_reader :strasse, :ort
  attr_writer :strasse, :ort
  def initialize(strasse, ort)
    @strasse = strasse
    @ort     = ort
  end
  def to_s()
    puts "{#@strasse}, {#@ort}"
  end
end

p1 = Person.new("p1", Adresse.new("s1", "o1"))
p2 = Person.new("p2", Adresse.new("s2", "o2"))
p3 = Person.new("p3", Adresse.new("s3", "o3"))
p4 = Person.new("p4", Adresse.new("s4", "o4"))

puts  p1.name[0..2] = "H"
p p1.name

a1 = [p1, p2, p3, p4]
a2 = a1.clone()
a3 = a1.map() {|p| p.clone()}
a4 = a1.map {|p| Person.new(p.name.clone(), p.adresse.clone())}
a5 = a1.map {|p| Marshal.load(Marshal.dump(p))}

 # a1[2].adresse.strasse = "s77777777"
 # a1[0] = Person.new("p5", Adresse.new("s5", "o5"))
 # a1[3].adresse.strasse[0..1] = "OOPS"
 # a5[3].adresse.ort[0..1] = "no go area"
 # a1[1].adresse= Adresse.new("s6666","o6" )


# p5 = Marshal.dump(p1)
# p6 = Marshal.load(p5)
#
# p p1
# p p5
# p p1
# p p6
#

#  p a1
#  p a2
#  p a3
#
# # p a4
#  p a5

a7 = [Person.new("agus", Adresse.new("s7", "o7")).freeze]
a7.freeze

a8 = a7.dup

puts a8.frozen?

p "abadnsajkdnsajkdnjk3234234234".to_bool
#p Integer("ab")