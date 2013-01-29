

module Term::Arithmetic

	def +(term)
		if term.is_a? Term and @vars.eql? term.vars
			Term.new(@coeff + term.coeff, @vars)
		end
	end

	def -(term)
		if term.is_a? Term and @vars.eql? term.vars
			Term.new(@coeff - term.coeff, @vars)
		end
	end

	def *(term)
		if term.is_a? Term
			temp_coeff = @coeff * term.coeff
			temp_vars  = @vars.merge(term.vars){ |k, oV, nV| oV + nV }
			Term.new(temp_coeff, temp_vars)
		end
	end

	def /(term)

	end

	def **(power)
		if power.is_a? Numeric
			temp = {}
			@vars.each{ |k, v| temp[k] = v * power }
			Term.new(@coeff**power, temp)
		end
	end

end