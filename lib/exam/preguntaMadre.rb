# -*- coding: utf-8 -*-
class Pregunta
    attr_reader :pr, :df

    include Comparable
	def initialize(pregunta, dificultad)
		@pr = pregunta
        @df = dificultad
	end
    
    def <=> (other)
        @df <=> other.df
    end

    def == (other)
        @pr == other.pr && @df == other.df
    end

end