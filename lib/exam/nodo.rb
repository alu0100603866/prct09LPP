# -*- coding: utf-8 -*-

class Nodo
	attr_reader :id, :valor
	attr_accessor :next
	def initialize(valor)
		@valor = valor
		@id = object_id	#identificador univoco
		@next = nil
	end
end