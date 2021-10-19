require 'test/unit'
require_relative "./arrays.rb"

class MyTest < Test::Unit::TestCase
  def setup

    ### Tests test_pos_alle_vielfache_von?
    @ary1 = []
    (0..100).step(2) {|elem| @ary1 << elem}
    @n1 = 2

    @ary4 = []
    (0..30).step(4) {|elem| @ary4 << elem}
    @n4 = 4

    @ary3 = []
    (0..30).step(3) {|elem| @ary3 << elem}
    @n3 = 3

    ### Tests sammle_strings_der_laenge & Tests casecmp
    @ary_strings_1 = %w{das ist ein Array mit vielen Strings der Laenge drei}
    @ary_strings_2 = %w{Das ist ein ARRAY mit vielen STRINGS der Laenge drei}
    @ary_strings_3 = %w{Das ist ein ARRAY mit vielen STRINGS}
    @ary_strings_4 = %w{Xenon}

    @erg_ary = ["das", "ist", "ein", "mit", "der"]
    @erg_ary_neg = ["Das ist ein falsches Ergebnis"]
    @erg_ary_leer = []
  end

  ### Tests test_pos_alle_vielfache_von?
  def test_pos_alle_vielfache_von?
    assert_equal(true, alle_vielfache_von?(@ary4, @n4), "Elemente des Arrays #{@ary4} sind keine vielfachen von #{@n4}")
  end

  def test_neg_alle_vielfache_von?
    assert_not_equal(false, alle_vielfache_von?(@ary1, @n1), "Elemente des Arrays #{@ary1} sind vielfachen von #{@n1}")
  end

  def test_grenz_alle_vielfache_von?
    assert_equal(true, alle_vielfache_von?(@erg_ary_leer, @n1), "Leeres Array [] nicht berücksichtigt")
  end


  ### Tests sammle_strings_der_laenge
  def test_sammle_strings_pos

    assert_equal(@erg_ary, sammle_strings_der_laenge(@ary_strings_1, 3), "Elemente des Arrays #{@ary_strings_1} sind der Laenge 3")
  end

  def test_sammle_strings_neg
    assert_not_equal(@erg_ary_neg, sammle_strings_der_laenge(@ary_strings_1, 3), "Elemente des Arrays #{@ary_strings_1} sind nicht der Laenge 3")
  end

  def test_sammle_strings_grenze
    assert_equal(@erg_ary_leer, sammle_strings_der_laenge(@erg_ary_leer, 3), "Leeres Array [] nicht berücksichtigt")
  end


  ### Tests casecmp
  def test_casecmp_pos
    assert_equal(1, casecmp(@ary_strings_1, @ary_strings_3), "Array #{@ary_strings_1} ist nicht groesser als #{@ary_strings_3}")
  end

  def test_casecmp_neg
    assert_not_equal(-1, casecmp(@ary_strings_1, @ary_strings_3), "Array #{@ary_strings_1} ist doch groesser als #{@ary_strings_3}")
  end

  def test_casecmp_grenze
    assert_equal(-1, casecmp(@erg_ary_leer, @ary_strings_1), "Leeres Array [] nicht berücksichtigt")
  end
end
