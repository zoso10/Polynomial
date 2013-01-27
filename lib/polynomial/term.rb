

class Term

	attr_accessor :coeff, :vars, :degree

	def initialize(coeff=1, param={})
		@vars = param
		@coeff = coeff
		@degree = param.empty? ? 0 : param.values.max
		self
	end

	def add_variable(var, power)
		@vars[var] = power
	end

	def to_s
		str = "#{@coeff}"
		@vars.each do |k, v|
			str << " * #{k}^#{v}"
		end
		str
	end



end

