require 'test/unit'
require 'Z:\win\Dokumente\Ruby\A2\A2-SoSe2019ImperativeSprachanteile\Uhr.rb'

class UhrzeitTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @uhr = Uhr.new()
    @uhr2 = Uhr.new(10,30,0)
  end

  def test_tick
    assert_equal("01",@uhr2.sekunden_anteil(), "Fehler")
  end

end