require 'test/unit'
require_relative '../lib/polynomial/term'

class TestTermArithmetic < MiniTest::Unit::TestCase

	def setup
		@t1 = Term.new(3, {x: 3, y: 2})
		@t2 = Term.new(5, {x: 1, y: 7})
		@t3 = Term.new(2, {x: 1, y: 1, z: 1})
		@t4 = Term.new(11)
		@t5 = Term.new(17, {x: 3, y: 2})
		@t6 = Term.new(3, {m: 3})
	end

	# Testing the strings is actually a bad way since it depends
	# a lot on the order of the variables. It could return false
	# if the variables were in a different order, even if it was correct
	# I'm doing it for simplicity and less typing... 
	# Maybe when I get more motivation and time I'll make them better

	def test_add
		assert_equal("20 * x^3 * y^2", (@t1 + @t5).to_s)
		assert_nil(@t1 + @t2)
	end

	def test_subtract
		assert_equal("-14 * x^3 * y^2", (@t1 - @t5).to_s)
		assert_nil(@t1 - @t4)
	end

	def test_mult
		assert_equal("15 * x^4 * y^9", (@t1*@t2).to_s)
		assert_equal("6 * x^1 * y^1 * z^1 * m^3", (@t3 * @t6).to_s)
	end

	# FIX INTEGER DIVISION!!!
	def test_divide
		assert_equal("1 * x^3 * y^2", (@t1 / 3).to_s)
		assert_equal("1 * x^-2 * y^5", (@t2 / @t1).to_s)
		assert_equal("1 * x^2 * y^1 * z^-1", (@t1 / @t3).to_s)
	end

	def test_power
		assert_equal("121", (@t4 ** 2).to_s)
		assert_equal("27 * x^9 * y^6", (@t1 ** 3).to_s)
	end

end
