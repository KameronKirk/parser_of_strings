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
        elsif input[0] = "'"
            r = input[1..-2]
        end

        #printing for debugging
        if print
            pp input
            pp r
        end

        return r
    end
end
