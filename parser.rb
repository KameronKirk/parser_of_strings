class Parser
    def convert(input, print = false)
        r = nil
        
        #array case
        if input.kind_of?(Array)
            r = input.map{|i| i.kind_of?(Array) ? convert(i) : convert('"' + i.to_s + '"')}

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
            puts input
            puts r
        end

        return r
    end
end
