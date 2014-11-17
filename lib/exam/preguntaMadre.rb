# -*- coding: utf-8 -*-
class Pregunta
    attr_reader :pr, :df, :correcta

    include Comparable
	def initialize(pregunta, dificultad)
		@pr = pregunta
        @df = dificultad
        @correcta = nil #debe modificarse; int que refiere a pos en Array de pr. 
	end
    
    def <=> (other)
        @df <=> other.df
    end

    def == (other)
        @pr == other.pr && @df == other.df
    end

end
