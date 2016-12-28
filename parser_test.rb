require 'minitest/autorun'
require './parser.rb'

class TestParser < Minitest::Test
    def test_convert_string_to_boolean
        p = Parser.new
        b = p.convert("false")
        assert false == b
    end
end
