# -*- coding: utf-8 -*-
class PreguntaVF < Pregunta
	def initialize(pregunta, correcta)
		super(pregunta)
		@correcta = correcta
	end
	def to_s
		string = ''
		string += @pr
		string += "\nVerdadero"
		string += "\nFalso"
	end
end
