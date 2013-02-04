require_relative 'term/arithmetic'
require_relative 'term/calculus'

class Term
	include Arithmetic
	include Calculus

	attr_accessor :coeff, :vars 
	attr_reader :degree

	def initialize(coeff=1, param={})
		@vars = param
		@coeff = coeff
		@degree = param.empty? ? 0 : param.values.max
		self
	end

	def evaluate(values)
		if @vars.keys.sort == values.keys.sort
			temp = @coeff
			values.each{ |k, v| temp *= (values[k] ** @vars[k]) }
			temp
		end
	end

	def to_s
		str = "#{@coeff}"
		@vars.each do |k, v|
			str << " * #{k}^#{v}"
		end
		str
	end

end
