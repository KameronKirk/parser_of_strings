require 'minitest/autorun'
require './parser.rb'

class TestParser < Minitest::Test
    def test_convert_string_to_boolean
        p = Parser.new

        r1 = p.convert("false")
        assert false == r1

        r2 = p.convert("true")
        assert true == r2
    end

    def test_convert_string_to_string
        p = Parser.new

        r = p.convert("'datto is hiring'")
        assert r.eql? "datto is hiring"
        
        r = p.convert("'\'d\' is for \'datto\''")
        assert r.eql? "'d' is for 'datto'"
    end

    def test_convert_string_with_escapse_to_string
        p = Parser.new

        r1 = p.convert("'\'d\' is for \'datto\''")
        assert r1.eql? "'d' is for 'datto'"

        r2 = p.convert("'\\'")
        assert r2.eql? "\\"

        r3 = p.convert("'\''")
        assert r3.eql? "'"

        r4 = p.convert("'true'")
        assert r4.eql? "true"
    end

    def test_convert_string_to_array
        p = Parser.new
        
        r = p.convert(["false", "'bob'"], true)
        assert r.eql? [false, "bob"]
    end
end
