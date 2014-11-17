# -*- coding: utf-8 -*-

class Examen
	attr_reader :nota
	def initialize (lista)
        lista.ordenar
		@preguntas = lista
        @nota = 0
		#inicializamos un array con 0 elementos para las respuestas
	end


	def to_s
        aux = @preguntas.head
        respuesta = ""
        respuesta += aux.value.to_s
        respuesta += "\n"
        while (aux != @preguntas.tail) do
            aux = aux.next
            respuesta += aux.value.to_s
            respuesta += "\n"
        end
        respuesta
	end
	
	def hacer_examen
	    score = 0
        @preguntas.each do |preg|
            puts preg.to_s
            resp = gets.chomp
            this = preg.resp_correcta?(resp)
            if (this == true)
                score += 1 
            end
        end
        puts "Puntuacion: " + score
	end
end
