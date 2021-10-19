require "./vektor"
class Matrix

  def initialize(zeilen, spalten)
    raise ArgumentError if !zeilen.is_a?(Numeric) || zeilen <= 0 || !spalten.is_a?(Numeric) || spalten <= 0
    @intern_matrix = Array.new(zeilen) {Array.new(spalten) {0}}
  end

  def kopiere_aus_array(ary)
    raise ArgumentError if not zwei_dim?(ary)

    for i in (0..([zeilen(), ary.size()].min() - 1))
      for j in (0..([spalten(), ary[1].size()].min() - 1))
        setze_element(i,j,ary[i][j])
      end
    end
    return self
  end

  def kopiere_in_array()
    kopie_array = Array.new(zeilen()) {Array.new(spalten()) {0}}
    for i in (0...zeilen())
      for j in (0...spalten())
        kopie_array[i][j] = lese_element(i, j)
      end
    end
    return kopie_array
  end

  def kopiere()
    mat_kop = Matrix.new(zeilen(), spalten())
    mat_kop.kopiere_aus_array(kopiere_in_array())

    return mat_kop
  end

  def zwei_dim?(ary)
    res = true

    ary.each do |elem|
       res = res && (elem.instance_of?(Array) && elem.each {|obj| !obj.instance_of?(Array) })
    end

    return res
  end

  def zeilen()
    return @intern_matrix.size
  end

  def spalten()
    return @intern_matrix[1].size
  end

  def setze_element(zeile, spalte, wert)
    @intern_matrix[zeile][spalte] = wert
  end

  def lese_element(zeile, spalte)
    return @intern_matrix[zeile][spalte]
  end

  def +(matrix)
    #check_same_size(matrix)

    mat_kop = kopiere()

    for i in 0...zeilen
      for j in 0...spalten
        mat_kop.setze_element(i, j, mat_kop.lese_element(i, j) + matrix.lese_element(i, j)) ##+= matrix[i][j]
      end
    end

    return mat_kop
  end

  def -(matrix)
    return kopiere + (matrix * (-1))
  end

  def *(zahl)

    mat_prod = Matrix.new(zeilen, spalten)

    for i in (0...zeilen)
      for j in (0...spalten)
        mat_prod.setze_element(i, j, lese_element(i, j) * zahl)
      end
    end

    return mat_prod
  end


  def check_indizes(zeile, spalte)
    raise ArgumentError, "Zeilenindex #{zeile} ungültig" if zeile >= zeilen
    raise ArgumentError, "Spaltenindex #{spalte} ungültig" if spalte >= spalten
  end

  def check_same_size(other)
    if self.zeilen != other.zeilen || self.spalten != other.spalten
      raise ArgumentError, "Matrizen haben nicht die gleiche Groesse self:(#{self.zeilen},#{self.spalten}) other:(#{other.zeilen},#{other.spalten})"
    end
  end

  def to_s()

    # format = "%#{laengstes_element.to_s.length}d " * spalten + "\n"
    # str = ""
    # @intern_matrix.each do |zeile|
    #   str << format % zeile
    # end
    # return str

    max_len = laengstes_element

    str = ""

    @intern_matrix.each() do |zeile|
      zeile.each() do |elem|
        str += "#{elem.to_s().rjust(max_len,' ')} "
      end
      str += "\n"
    end
    return str
    # for i in 0...zeilen
    #   for j in 0...spalten
    #     tmp = lese_element(i, j)
    #
    #     # Geht das eleganter?
    #     if tmp < 0
    #
    #        str += "#{str}#{tmp.to_s.size < max_len ? ' ' : ''}"
    #
    #
    #       str += "-"
    #       str += ("#{lese_element(i, j).abs.to_s.rjust(max_len - 1, " ")} ").lstrip
    #     else
    #       str += ("#{lese_element(i, j).abs.to_s.rjust(max_len, " ")} ")
    #     end
    #
    #   end
    #   str += ("\n")
    # end

    return str
  end

  def laengstes_element()
    max = 0

    @intern_matrix.each do |zeilen|
      zeilen.each do |elem|
        elem_size = elem.to_s.size
        max = [max, elem_size].max
      end
    end

    return max
  end


  # OPTIONAL!!!!!
  def mat_mult(matrix)
    if self.spalten != matrix.zeilen
      raise ArgumentError, "Zeilen der ersten Matrix und Spalten der 2'ten Matrix muessen gleiche Länge haben"
    end

    matrix_produkt = Matrix.new(zeilen(), matrix.spalten())

    for zeile_index in (0...zeilen())
      for spalte_index in (0...matrix_produkt.spalten())

        int_zeile_index = self.zeilen_vektor(zeile_index)
        matrix_spalte_index = matrix.spalten_vektor(spalte_index)

        matrix_produkt.setze_element(zeile_index, spalte_index, int_zeile_index.skalar_produkt(matrix_spalte_index))
      end
    end
    return matrix_produkt
  end

  # Optional
  def zeilen_vektor(zeile)

    return Vektor.new(@intern_matrix[zeile])
  end

  # Optional
  def spalten_vektor(spalte)
    # Vektor.new(@intern[1][spalte])
    array_vektor = Array.new()
    for zeile_index in (0...zeilen())
      elem = lese_element(zeile_index, spalte)
      array_vektor << elem
    end
    return Vektor.new(array_vektor)
  end


end

