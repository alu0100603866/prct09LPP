# -*- coding: utf-8 -*-
class Pregunta
    attr_reader :pr, :df 
    attr_accessor :correcta

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

	def resp_correcta?(resp)
		if resp.to_i != 0
			resp = resp.to_i	#sera numero, lo pasamos a int.
		else
			resp.upcase!	    #sera String, admitimos mayus y minus.
		end
		
		if resp == @correcta
            puts "Respuesta correcta"
			true
		else
            puts "Respuesta incorrecta"
			false
		end
	end

end
