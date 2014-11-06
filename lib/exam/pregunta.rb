# -*- coding: utf-8 -*-
class PreguntaS < Pregunta

	attr_reader :re
	def initialize (pregunta, dificultad)
		super
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

	def to_s
		preg + "\n\n" + resp
	end
end

