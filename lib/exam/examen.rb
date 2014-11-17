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
        @preguntas.each do |preg|
            puts preg.to_s
            resp = gets.chomp
            preg.resp_correcta?(resp)
        end
	end
end