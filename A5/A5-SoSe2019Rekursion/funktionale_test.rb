require 'test/unit'
require_relative  './funktionale'

class FunktionaleTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @palims_gerade = %w{Hannah Otto Regallager Reittier}
    @palims_ungerade = %w{neben Reliefpfeiler Rentner}

    @satz_palim1 = "Erika feuert nur untreue Fakire."
    @satz_palim2 = "Trug Tim eine so helle Hose nie mit Gurt?"

    song_of_bob = "I, man, am regal - a German am I
Never odd or even
If I had a hi-fi
Madam, I'm Adam
Too hot to hoot
No lemons, no melon
Too bad I hid a boot
Lisa Bonet ate no basil
Warsaw was raw
Was it a car or a cat I saw?

Rise to vote, sir
Do geese see god?
\"Do nine men interpret?\" \"Nine men,\" I nod
Rats live on no evil star
Won't lovers revolt now?
Race fast, safe car
Pa's a sap
Ma is as selfless as I am
May a moody baby doom a yam?

Ah, Satan sees Natasha
No devil lived on
Lonely Tylenol
Not a banana baton
No \"x\" in \"Nixon\"
O, stone, be not so
O Geronimo, no minor ego
\"Naomi,\" I moan
\"A Toyota's a Toyota\"
A dog, a panic in a pagoda"

    @song_of_bob_lines = song_of_bob.split("\n")

    @kein_palim1 = "oa"
    @kein_palim2 = "unerhoert"
    @kein_satz_palim = "Erika feuert untreue Fakire."

    @leerer_string = ""
    @ein_zeichen_string = "x"
  end


  def test_palindrom_pos()
    @palims_gerade.each() do |palim|
      assert_true(palindrom?(palim))
    end
    @palims_ungerade.each() do |palim|
      assert_true(palindrom?(palim))
    end
    @song_of_bob_lines.each() do |palim|
      assert_true(palindrom?(palim))
    end
    assert_true(palindrom?(@satz_palim1))
    assert_true(palindrom?(@satz_palim2))
  end

  def test_palindrom_neg()
    assert_false(palindrom?(@kein_palim1))
    assert_false(palindrom?(@kein_palim2))
    assert_false(palindrom?(@kein_satz_palim))
  end
  def test_palindrom_grenze()
    assert_true(palindrom?(@leerer_string))
    assert_true(palindrom?(@ein_zeichen_string))
  end
end