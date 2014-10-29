require 'pry'

Nodo = Struct.new(:value, :next)

class Lista
        def initialize
                @arr = []
                @head = nil
        end

        def addn(nodo)  #coloca un nuevo nodo como cabeza
                nodo.next = @head
                @head = nodo.object_id
                @arr << nodo
        end

        def deln	#elimina el nodo cabeza
        	@arr.shift
        end

        def first 	#devuelve el nodo cabeza
                @arr.first
        end

end

