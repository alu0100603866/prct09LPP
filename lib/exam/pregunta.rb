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

	def resp_correcta?(resp)
		if resp.to_i != 0
			resp.to_i!		#sera numero, lo pasamos a int.
		else
			resp.downcase!	#sera String, admitimos mayus y minus.
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

