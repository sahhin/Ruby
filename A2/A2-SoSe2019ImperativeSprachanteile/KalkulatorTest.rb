require 'test/unit'
require './A2/A2-SoSe2019ImperativeSprachanteile/kalkulator'

class KalkulatorTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @kalk = Kalkulator.new()
  end

  def test_sum_kubik
    #wir nehmen an, dass die rechnungen korrekt sind
    assert_equal(9, @kalk.sum_kubik(2), "Test fehlgeschlagen")
    assert_equal(100, @kalk.sum_kubik(4), "Test fehlgeschlagen")
    assert_equal(0, @kalk.sum_kubik(-1), "Test fehlgeschlagen")

    #wir nehmen an, dass die rechnungen NICHT korrekt sind
    assert_not_equal(10, @kalk.sum_kubik(2), "Test fehlgeschlagen")
  end

  def test_fak

    assert_equal(1, @kalk.fak(1), "Test fehlgeschlagen")
    assert_equal(2, @kalk.fak(2), "Test fehlgeschlagen")
    assert_equal(6, @kalk.fak(3), "Test fehlgeschlagen")
    assert_equal(120, @kalk.fak(5), "Test fehlgeschlagen")
    assert_equal(1, @kalk.fak(0),"Test fehlgeschlagen")

    assert_not_equal(2, @kalk.fak(-3),"Test fehlgeschlagen")
  end

  def test_fak_start
    assert_equal(336, @kalk.fak_start(6,8), "Test fehlgeschlagen")
    assert_equal(2520, @kalk.fak_start(3,7), "Test fehlgeschlagen")

    assert_nil(@kalk.fak_start(0,0))
    assert_not_equal(123, @kalk.fak_start(-3,-3),"Test fehlgeschlagen")
  end

  def test_reihe_sin
    x = Math::PI / 4
    puts (@kalk.reihe_sin(5,2))
    puts (Math.sin(5))

    puts (Math.sin(5)-@kalk.reihe_sin(5,2)).abs()
    assert_in_delta(Math.sin(5), @kalk.reihe_sin(5,2),"Test fehlgeschlagen")
    assert_equal(-2661959, @kalk.reihe_sin(18,10),"Test fehlgeschlagen")
    assert_equal(31192, @kalk.reihe_sin(15,11),"Test fehlgeschlagen")

    #assert_compare(Math::sin(x), "<",@kalk.reihe_sin(x))

  end

  def test_n_fuer_fehler_kleiner
    eps = 0.5
    assert_in_epsilon(2,@kalk.n_fuer_fehler_kleiner(Math::PI/4,eps),eps,"Test fehlgeschlagen")
  end

  def test_binom
    assert_equal(916895, @kalk.binom(70,66),"Test fehlgeschlagen")
    assert_equal(21, @kalk.binom(7,2),"Test fehlgeschlagen")
    assert_equal(190, @kalk.binom(20,2),"Test fehlgeschlagen")

    assert_not_equal(10, @kalk.binom(20,2),"Test fehlgeschlagen")
    assert_not_equal(19, @kalk.binom(20,2),"Test fehlgeschlagen")


    assert_nil(@kalk.binom(0,66),"Test fehlgeschlagen")
    assert_nil(@kalk.binom(-10,-66),"Test fehlgeschlagen")
  end


end