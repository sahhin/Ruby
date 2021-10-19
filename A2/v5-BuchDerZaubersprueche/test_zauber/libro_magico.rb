class LibroMagico
  def initialize()

    @sprueche   = Array.new()
    @hexen      = ["Maria", "Elisa","Fernanda"]
    @ary        = Array.new(5){|zeile| zeile+2}
    @sprueche_2 = %w{Accion 1 Accion 2}
    @rango      = (1.0..5.5)

  end

  def to_s()
    puts "#{@ary.to_s()}" + "#{@sprueche_2} + #{@rango}"
  end


  def probando (x)
    puts  @rango.include?(x)
    puts  @rango.first()
  end
  def spruech_eintragen(spruch)
    @sprueche << spruch
    #@hexen    << hexe


  end

  def spruch_ausgeben()
    # puts @sprueche[x]
    # return @sprueche.size()
    @sprueche.each() {|h|
      puts h
    }
  end

  # def iterator_each()
  #
  #
  #   @sprueche.each_with_index do |zeile| puts @sprueche
  #
  # end

  end



nuevo_libro = LibroMagico.new()

puts nuevo_libro.spruech_eintragen("Abracadabra")
puts nuevo_libro.spruech_eintragen("Stradavarius")
puts nuevo_libro.spruech_eintragen("Increíble")


puts nuevo_libro.to_s()
# puts nuevo_libro.spruch_ausgeben()
puts nuevo_libro.iterator_each()