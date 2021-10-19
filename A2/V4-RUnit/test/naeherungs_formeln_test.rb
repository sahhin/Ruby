require "./naeherungs_formeln"
require "test/unit"


# Hinweis dieser Test funktioniert nur, wenn Sie die Loesung fuer die Formeln 
# in das Script naeherungs_formeln.rb schreiben, oder im require Ihre Datei einsetzen

class NaeherungsFormelnTest < Test::Unit::TestCase
  
  def setup()
    @x05 = 0.5
    @xkleiner05 = -7.4
    @ikleiner1 = 0

    
    @x051 = 0.51
    @delta_051_1 = 0.28744
    @delta_051_91 = 0.000141 # 0.00014049854498576764
    @delta_051_191 = 1.228993e-06 # 1.2289927346920138e-06

    @x4 = 4
    @delta_4_1 = 0.6363 # 0.6362943611198906
    @delta_4_91 = 1.3545e-13 # 1.354472090042691e-13
    @delta_4_111 = 1.11023e-15 # 1.1102230246251565e-15
    
    @n1 = 1
    @n91 = 91
    @n111 = 111
    @n191 = 191
     
  end
  
  def test_pos_051()
    assert_in_delta(Math.log(@x051),ln(@x051,@n1),@delta_051_1,"Betrag der Differenz exakt - genaehert mit x=#{@x051} und n=#{@n1} ungefaehr: #{@delta_051_1}")
    assert_in_delta(Math.log(@x051),ln(@x051,@n91),@delta_051_91,"Betrag der Differenz exakt - genaehert mit x=#{@x051} und n=#{@n91} ungefaehr: #{@delta_051_91}")
    assert_in_delta(Math.log(@x051),ln(@x051,@n191),@delta_051_191,"Betrag der Differenz exakt - genaehert mit x=#{@x051} und n=#{@n191} ungefaehr: #{@delta_051_191}")
  end
  
  def test_pos_4()
    assert_in_delta(Math.log(@x4),ln(@x4,@n1),@delta_4_1,"Betrag der Differenz exakt - genaehert mit x=#{@x4} und n=#{@n1} ungefaehr: #{@delta_4_1}")
    assert_in_delta(Math.log(@x4),ln(@x4,@n91),@delta_4_91,"Betrag der Differenz exakt - genaehert mit x=#{@x4} und n=#{@n91} ungefähr: #{@delta_4_91}")
    assert_in_delta(Math.log(@x4),ln(@x4,@n111),@delta_4_111,"Betrag der Differenz exakt - genaehert mit x=#{@x4} und n=#{@n111} ungefähr: #{@delta_4_111}")
  end
  
  def test_neg_grenzfaelle
    assert_equal(-1,ln(@x05,20),"Formel fuer x=0.5 nicht gueltig. Erwartet wird der Fehlerwert -1.")
    assert_equal(-1,ln(@xkleiner05,20),"Formel fuer x=-7.4<0.5 nicht gueltig. Erwartet wird der Fehlerwert -1.")
    assert_equal(-1,ln(4,@ikleiner1),"Formel fuer n<1 nicht gueltig. Erwartet wird der Fehlerwert -1.")
  end
end