class Nodo
	attr_reader :id, :valor
	attr_accessor :next
	def initialize(id, valor)
		@valor = valor
		@id = indice	#identificador univoco
		@next = nil
	end
end

class Lista
	def initialize
		@arr = []
		@head = nil
		@id_counter = 0	#sirve para dar id unico a los nodos
	end

	def addn(valor)	#coloca un nuevo nodo como cabeza
		new_node = Nodo.new(id_counter, valor)
		new_node.next = @head
		@head = new_node.id
		@id_counter += 1
	end
#el metodo addn recibe un objeto y lo encapsula en un nodo.

	def deln	#elimina el nodo cabeza
		@arr.pop
	end
end
