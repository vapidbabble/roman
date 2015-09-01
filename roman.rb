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
