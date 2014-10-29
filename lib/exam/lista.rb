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
                @tail.next = nil
            end
            
            if (!head.nil?)
                @head.previus = nodo
            end

            nodo.previus = nil
            #si en vez de nil ponemos tail, es una lsita circular, es decir unimos head con tail en previus
            
            @head = nodo
           
            #@tail.next = @head añadir esto para que la lista sea circular tail apuntara a head como siguiente
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

