require 'pry'

Nodo = Struct.new(:value, :next, :previus)

class Lista
    
        def initialize
                @head = nil
                @tail = nil
        end

        def addn(nodo)  #coloca un nuevo nodo como cabeza !push
            nodo.next = @head

            if (!@head.nil? && @head.next.nil?)
                @tail = @head
            end
            
            if (!head.nil?)
                @head.previus = nodo
            end

            nodo.previus = @tail
            @head = nodo
        end

        def deln	#elimina el nodo cabeza !pop
            aux = @head
            if (@head.next.nil?)
                @tail = nil
                @head = nil
            else
                @head = @head.next
                @head.previus = @tail
            end
            aux.value
        end
        
        def head
            @head
        end

        def tail
            @tail
        end
end

