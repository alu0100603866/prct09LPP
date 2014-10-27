require "exam"

require 'spec_helper'

describe Exam do
	before :all do
		@p1 = Pregunta.new("¿Pregunta?")
	end

	describe 'Seleccion simple' do
		it 'Debe existir una pregunta' do
			expect(@p1.pr).to eq("¿Pregunta?")
		end
		
		it 'Debe existir un metodo para obtener la pregunta' do
			expect(@p1.preg).to eq("Pregunta: ¿Pregunta?")
		end

		it 'Deben existir opciones de respuesta(introducir respuesta)' do
			@p1.addr("Si.")
			expect(@p1.re).not_to be_empty
		end
	
		it 'Se debe invocar a un metodo para obtener las opciones de respuesta' do
			@p1.addr("No.")
			expect(@p1.resp).to eq("1) Si.\n2) No.\n")
		end
	
		it 'Se debe mostrar por consola la pregunta y las opciones de respuesta' do
			expect(@p1.to_s).to eq("Pregunta: ¿Pregunta?\n\n1) Si.\n2) No.\n")
		end
	end

	describe 'Lista enlazada' do
		before :all do
			@lista = Lista
		end	
	end


end


