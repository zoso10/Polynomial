require_relative "polynomial/operations"

class Polynomial
	include Operations

	attr_reader :terms, :num

	def initialize(*params)
		@num = Random.rand  # purely for testing
	end

	def to_s

	end

end

