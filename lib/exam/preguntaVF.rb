
class PreguntaVF
	def initialize(pregunta, correcta = :V)
		super
		@correcta = correcta
	end
	def to_s
		string = ''
		string += @preg.to_s
		string += "\nVerdadero"
		string += "\nFalso"
	end
end
