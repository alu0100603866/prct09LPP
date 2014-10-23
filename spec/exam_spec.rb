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
	end

end


