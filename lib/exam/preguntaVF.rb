# -*- coding: utf-8 -*-
class PreguntaVF < Pregunta
	def initialize(pregunta, dificultad, correcta = true)
		super(pregunta, dificultad)
		@correcta = correcta
	end
	def to_s
		string = ''
		string += @pr
		string += "\nVerdadero"
		string += "\nFalso"
	end
end
