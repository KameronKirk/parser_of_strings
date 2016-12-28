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
    end

    def test_convert_string_with_escapse_to_string
        p = Parser.new
        r1 = p.convert("'\'d\' is for \'datto\''")
        assert r1.eql? "'d' is for 'datto'"

        r2 = p.convert("'\\'")
        assert r2.eql? "\\"

        r3 = p.convert("'\''", true)
        assert r3.eql? "'"
    end
end
