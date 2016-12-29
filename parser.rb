require 'pp'

class Parser
    def convert(input, print = false)
        r = nil
        
        #array case
        if input.kind_of?(Array)
            r = input.map{|i| convert(i, print)}

        #boolean case
        elsif input == "false"
            r = false
        elsif input == "true"
            r = true

        #string case
        elsif input[0] == "'"
            r = input[1..-2]
        end

        #printing for debugging
        if print
            pp input
            pp input.class
            pp r
            pp r.class
        end

        return r
    end

    # Simple protection from running without input, for test suit.
    if ARGV[0]
        p = Parser.new
        r = p.convert(ARGV[0], false)
        puts "Input  <<<"
        pp ARGV[0]
        pp ARGV[0].class

        puts "Output >>>"
        pp r
        pp r.class
    end
end
