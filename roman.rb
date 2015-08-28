require "minitest/autorun"

class Roman
# third thursday of the month
    def initialize()
        @romanlist = [["M", 1000],
                   ["CM", 900],
                   ["D",  500],
                   ["CD", 400],
                   ["C",  100],
                   ["XC",  90],
                   ["L",   50],
                   ["XL",  40],
                   ["X",   10],
                   ["IX",   9],
                   ["V",    5],
                   ["IV",   4],
                   ["I",    1]]        
    end

    def convert_to(arabic)
        roman=""
        countdown=arabic
        @romanlist.each do |rsymbol,num|
            while countdown >= num
                roman << rsymbol
                countdown -= num
            end
        end
        roman
    end
end

class TestConvert < Minitest::Test
  def setup
    @convert = Roman.new
  end

  def test_basic
    assert_equal "VIII", @convert.convert_to(8)
    assert_equal "XLIX", @convert.convert_to(49)
    assert_equal "MMXV", @convert.convert_to(2015)
    assert_equal "MMMMMMDCCLXXXIX", @convert.convert_to(6789)
  end

end


