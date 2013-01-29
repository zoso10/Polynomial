require_relative "arithmetic.rb"

class Term
	include Arithmetic

	attr_accessor :coeff, :vars 
	attr_reader :degree

	def initialize(coeff=1, param={})
		@vars = param
		@coeff = coeff
		@degree = param.empty? ? 0 : param.values.max
		self
	end

	def evaluate(vars)

	end

	def to_s
		str = "#{@coeff}"
		@vars.each do |k, v|
			str << " * #{k}^#{v}"
		end
		str
	end

end

