require "minitest/autorun"
require_relative 'roman'

class TestConvert < Minitest::Test
  def setup
    @convert = Roman.new
  end

  def test_to_roman
    assert_equal "VIII", @convert.convert_to_roman(8)
    assert_equal "XLIX", @convert.convert_to_roman(49)
    assert_equal "MMXV", @convert.convert_to_roman(2015)
    assert_equal "MMMMMMDCCLXXXIX", @convert.convert_to_roman(6789)
  end

  def test_to_arabic_old
    assert_equal @convert.convert_to_arabic_old("VIII"), 8
    assert_equal @convert.convert_to_arabic_old("XLIX"), 49
    assert_equal @convert.convert_to_arabic_old("MMXV"), 2015
    assert_equal @convert.convert_to_arabic_old("MMMMMMDCCLXXXIX"), 6789
  end

  def test_to_arabic
    assert_equal @convert.convert_to_arabic("VIII"), 8
    assert_equal @convert.convert_to_arabic("XLIX"), 49
    assert_equal @convert.convert_to_arabic("MMXV"), 2015
    assert_equal @convert.convert_to_arabic("MMMMMMDCCLXXXIX"), 6789
  end

end
