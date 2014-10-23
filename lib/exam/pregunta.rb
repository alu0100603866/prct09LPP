class Pregunta

	attr_reader :pr
	def initialize (pregunta)
		@pr = pregunta
		@re = Array.new(0) 
		#inicializamos un array con 0 elementos para las respuestas
	end

	def preg
		"Pregunta: #{@pr}"
	end
end

