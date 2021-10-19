require 'test/unit'
require "./palindrom"
require "./Kreis"

class PalindromTest < Test::Unit::TestCase

  def setup()
    @pos1 = "neben"
    @pos2 = "Reliefpfeiler"
    @neg1 = "Stuhl"
    @neg2 = "bA"
    @neg3 = 7
    @neg4 = 16.9
    @neg5 = Object.new()
    @neg6 = Kreis.new()
    @neg6 = nil
    @g1 = ""
    @g2 = "X"
  end

  def test_positiv
    assert_equal(true,palindrom?(@pos1), "Palindrom mit ungerader Anzahl an Zeichen #{@pos1} wurde nicht erkannt")
    assert_equal(true,palindrom?(@pos2), "Palindrom mit gerader Anzahl an Zeichen #{@pos2} wurde nicht erkannt")
  end

  def test_negativ
    assert_not_equal(true, palindrom?(@neg1), "#{@neg1} ist kein Palindrom")
    assert_not_equal(true, palindrom?(@neg2), "#{@neg2} ist kein Palindrom")
    assert_not_equal(true, palindrom?(@neg3), "#{@neg3} ist kein Palindrom")
    assert_not_equal(true, palindrom?(@neg4), "#{@neg4} ist kein Palindrom")
    assert_not_equal(true, palindrom?(@neg5), "#{@neg5} ist kein Palindrom")
    assert_not_equal(true, palindrom?(@neg6), "#{@neg6} ist kein Palindrom")
  end

  def test_grenzfaelle
    assert(palindrom?(@g1),"Grenzfall leere Zeichenkette nicht beachtet")
    assert(palindrom?(@g2),"Grenzfall 1-elem Zeichenkette nicht korrekt behandelt")
  end

end
