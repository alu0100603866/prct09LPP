class Pregunta

	attr_reader :pr, :re
	def initialize (pregunta)
		@pr = pregunta
		@re = Array.new(0) 
		#inicializamos un array con 0 elementos para las respuestas
	end

	def preg
		"Pregunta: #{@pr}"
	end
	
	def addr (respuesta)
		@re.push(respuesta)
	end

	def resp
		respuestas = ""
		for i in (0..(@re.length - 1))
			respuestas += "#{i+1}) #{@re[i]}\n"
		end
		respuestas
	end
end

