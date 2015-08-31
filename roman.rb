require "minitest/autorun"

class Roman
# third thursday of the month
    def initialize()
        @romanlist = Hash[[["M", 1000],
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
                   ["I",    1]]]

    end

    def convert_to_roman(arabic)
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

    def convert_to_arabic_old(str)
        arabic=0
        myind=0
        edge=false
        str.each_char do |ele|
            if edge
                edge=false
                myind+=1
                next
            end
            value=@romanlist[ele]
            substr=str.slice(myind,2)
            if (substr.length == 2)  && (value < @romanlist[substr[1]])
                value=@romanlist[substr]
                edge=true
            end
            myind+=1
            arabic+=value
        end
        arabic
    end

    
    def convert_to_arabic(str)
        arabic=0
        @romanlist.each do |rsymbol,num|
            len=rsymbol.length
            while str.slice(0,len) == rsymbol
                arabic+=num
                str.slice!(0,len)
            end
        end
        arabic
    end


end

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


