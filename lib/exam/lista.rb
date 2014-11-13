# -*- coding: utf-8 -*-

Nodo = Struct.new(:value, :next, :previus)

class Nodo
    include Comparable
    def <=> (other)
        value <=> other.value
    end
end

class Lista
        include Enumerable
        def initialize
                @head = nil
                @tail = nil
        end

        def addn(nodo2)  #coloca un nuevo nodo como cabeza !push
            nodo = Nodo.new()
            
            if (nodo2.class == Nodo)
                    nodo = nodo2
            else
                nodo.value = nodo2
            end
            
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
        
        def each(&block)
            current_node = @head
            
            while current_node != nil
                block.call(current_node)
                current_node = current_node.next
            end
        end
        
        def ordenar()
           contador = self.count-1
           aux = self.sort
           @head = nil
           while (!aux[contador].nil?) do
                self.addn(aux[contador])
                contador = contador-1
           end
        end
end

