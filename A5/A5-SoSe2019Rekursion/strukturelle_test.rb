require 'test/unit'
require_relative './strukturelle'
class StrukturelleTest < Test::Unit::TestCase


  def setup
    setup_max_width()
    setup_deep_count_elems_with_ary()
    setup_deep_reverse()
    setup_deep_group_by_type()
  end

  def setup_max_width
    @ary_complex = [[82, [46, [37]], 34], 17, [45, 5, [90, [[28], [62], 59, [[[25], [52], 80, 38, [52, [], [56, 15]], [41], [77, [9, 1], [], 41]]], []], []]], [[], 6, [], [40]], 6]
    @ary_empty = []
    @ary_simple = [1, 2, 3, 4, 5]
  end

  def test_max_width_pos()
    assert_equal(7, max_width(@ary_complex))
    assert_equal(5, max_width(@ary_simple))
  end

  def test_max_width_grenze()
    assert_equal(0, max_width(@ary_empty))
  end


  def setup_deep_count_elems_with_ary()
    @deep_count_expected_empty = [[0, []]]
    @deep_count_expected_ary_simple =[[5, [1, 2, 3, 4,5]]]
    @ary_nested = [1, [2, [3, [4]]]]
    @deep_count_expected_ary_nested =[[7, [1, [2, [3, [4]]]]], [5, [2, [3, [4]]]], [3, [3, [4]]], [1, [4]]]
  end

  def test_deep_count_elems_with_ary_pos()
    assert_equal(@deep_count_expected_ary_simple,deep_count_elems_with_ary(@ary_simple))
    assert_equal(@deep_count_expected_ary_nested,deep_count_elems_with_ary(@ary_nested))
  end

  def test_deep_count_elems_with_ary_grenze()
    assert_equal(@deep_count_expected_empty,deep_count_elems_with_ary(@ary_empty))
  end


  def setup_deep_group_by_type


    @deep_group_expected_empty = {}

    @mixed1 = [[:njk, 0.156], :jfh, :rxd]
    @deep_group_expected_mixed1 = {Symbol=>[:njk, :jfh, :rxd], Float=>[0.156]}

    @mixed2 = [[[], [68], :dki, [], 61], :wjx, [92]]
    @deep_group_expected_mixed2 = {Integer=>[68, 61, 92], Symbol=>[:dki, :wjx]}

    @mixed_complex = [["nsr"], [[58, 0.026], [[[[], [68], :dki, [], 61], :wjx, [92]], [:tms, [[:fhn, 96], [], [], 38], [[], [82, "ena"], ["nge"]]], 14, [:kcj, "qlw"]], 16], [], [[:njk, 0.156], :jfh, :rxd], "cjs"]
    @deep_group_expected_mixed_complex = {String=>["nsr", "ena", "nge", "qlw", "cjs"], Integer=>[58, 68, 61, 92, 96, 38, 82, 14, 16], Float=>[0.026, 0.156], Symbol=>[:dki, :wjx, :tms, :fhn, :kcj, :njk, :jfh, :rxd]}
  end

  def test_deep_group_pos()
    assert_equal(@deep_group_expected_mixed1,deep_group_by_type(@mixed1))
    assert_equal(@deep_group_expected_mixed2,deep_group_by_type(@mixed2))
    assert_equal(@deep_group_expected_mixed_complex,deep_group_by_type(@mixed_complex))
  end

  def test_deep_group_grenze()
    assert_equal(@deep_group_expected_empty,deep_group_by_type(@ary_empty))
  end

  def setup_deep_reverse

    @hash_empty = {}
    @deep_reverse_expected_hash_empty = {}

    @hash1 = {{24=>71}=>90}
    @deep_reverse_expected_hash1 = {90=>{71=>24}}

    @hash2 = {{1=>76, 67=>80, 35=>51, 10=>{71=>46, 31=>2, 44=>38, 33=>27}}=>60}
    @deep_reverse_expected_hash2 = {60=>{76=>1, 80=>67, 51=>35, {46=>71, 2=>31, 38=>44, 27=>33}=>10}}

    @hash_complex = {85=>59, 39=>68, 70=>{{1=>76, 67=>80, 35=>51, 10=>{71=>46, 31=>2, 44=>38, 33=>27}}=>60, 16=>69, 18=>55, 70=>52, 83=>{{0=>36, 51=>10, {36=>65, 99=>0, 76=>54, 0=>50, 20=>80, 33=>6, 86=>36, 14=>64}=>13}=>65, 84=>25, 5=>2, 89=>77, 66=>13}}, {32=>4, 34=>8, 92=>83, {28=>48, 36=>9, 53=>46, 82=>0, 58=>14, 66=>3}=>32, 29=>33, {35=>69, 68=>72, 14=>20, 92=>85}=>{64=>80, 92=>89, 99=>97, 88=>43, 13=>85, 91=>94, 15=>80, 45=>77, 89=>77, 78=>6}}=>48, {24=>71}=>90, 47=>97, 73=>52}

    @deep_reverse_expected_hash_complex =
        {59=>85,68=>39,{60=>{76=>1, 80=>67, 51=>35,
                             {46=>71, 2=>31, 38=>44, 27=>33}=>10},
                        69=>16, 55=>18, 52=>70,
                        {65=>{36=>0, 10=>51, 13=>{65=>36, 0=>99, 54=>76, 50=>0, 80=>20, 6=>33, 36=>86, 64=>14}},
                         25=>84, 2=>5, 77=>89, 13=>66}=>83}=>70,
         48=>{4=>32, 8=>34, 83=>92, 32=>{48=>28, 9=>36, 46=>53, 0=>82, 14=>58, 3=>66},
              33=>29, {80=>15, 89=>92, 97=>99, 43=>88, 85=>13, 94=>91, 77=>89, 6=>78}=>{69=>35, 72=>68, 20=>14, 85=>92}}, 90=>{71=>24}, 97=>47, 52=>73}
  end

  def test_deep_reverse_positive()
    assert_equal(@deep_reverse_expected_hash1,deep_reverse( @hash1))
    #puts "--------"
    assert_equal(@deep_reverse_expected_hash2,deep_reverse( @hash2))
    #puts "-----------------------------"
    #puts @deep_reverse_expected_hash_complex==deep_reverse(@hash_complex)
    assert_equal(@deep_reverse_expected_hash_complex,deep_reverse( @hash_complex),"bla bla")
  end

  def test_deep_reverse_grenze()
    assert_equal(@deep_reverse_expected_hash_empty,deep_reverse(@hash_empty))
  end
end