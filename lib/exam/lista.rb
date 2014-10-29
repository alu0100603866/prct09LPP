require 'pry'

Nodo = Struct.new(:value, :next)

class Lista
    
        def initialize
                @head = nil
        end

        def addn(nodo)  #coloca un nuevo nodo como cabeza !push
                nodo.next = @head
                @head = nodo
        end

        def deln	#elimina el nodo cabeza !pop
            @head = @head.next
        end
        
        def head
            @head
        end

end

