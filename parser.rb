class Parser
    def convert(input, print = false)
        r = nil
        
        #boolean case
        if input == "false"
            r = false
        elsif input == "true"
            r = true

        #string case
        elsif input[0] = '\''
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
