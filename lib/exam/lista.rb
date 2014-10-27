require 'pry'

class Lista
        def initialize
                @arr = []
                @head = nil
        end

        def addn(nodo)  #coloca un nuevo nodo como cabeza
                nodo.next = @head
                @head = nodo.id
                @arr << nodo
        end

        def deln        #elimina el nodo cabeza
                unless @head == nil     #evitamos que se ejecute si el array ya esta vacio
                        @head = get_nodo(@head).id
                        @arr.pop
                end
        end

        protected
        def get_nodo(id)
                @arr.each do |a|
                        return a if a.id
                end
        end
        #este metodo violaria las limitacions de la lista, de ser usado por el usuario.
        #solo se usa para simular como seria la implementacion en una estructura de datos desconexa.

        def get_first #devuelve el nodo cabeza
                get_nodo(@head).id
        end

binding.pry

end

