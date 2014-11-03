require "exam"

require 'spec_helper'

describe Exam do
	before :all do
		@p1 = PreguntaS.new("¿Pregunta?")
	end

	describe 'Seleccion simple' do
		it 'Debe existir una pregunta.' do
			expect(@p1.pr).to eq("¿Pregunta?")
		end
		
		it 'Debe existir un metodo para obtener la pregunta.' do
			expect(@p1.preg).to eq("Pregunta: ¿Pregunta?")
		end

		it 'Deben existir opciones de respuesta(introducir respuesta).' do
			@p1.addr("Si.")
			expect(@p1.re).not_to be_empty
		end
	
		it 'Se debe invocar a un metodo para obtener las opciones de respuesta.' do
			@p1.addr("No.")
			expect(@p1.resp).to eq("1) Si.\n2) No.\n")
		end
	
		it 'Se debe mostrar por consola la pregunta y las opciones de respuesta.' do
			expect(@p1.to_s).to eq("Pregunta: ¿Pregunta?\n\n1) Si.\n2) No.\n")
		end
	end


it 'Prueba relacion de preguntas' do
    
    @p1 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?")
    @p1.addr("<#Xyz:0xa000208>")
    @p1.addr("nil")
    @p1.addr("0")
    @p1.addr("Ninguna de las anteriores")
    
    @p2 = PreguntaS.new("La siguiente definicion de un hash en ruby es valida:\nhash_raro = {\n[1,2,3] => Object.new(),\nHash.new => :toto")
    @p2.addr("Cierto")
    @p2.addr("Falso")
    
    @p3 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?")
    @p3.addr("1")
    @p3.addr("bob")
    @p3.addr("HEY")
    @p3.addr("Ninguna de las anteriores")
    
    @p4 = PreguntaS.new("Cual es el tipo de objeto en el siguiente codigo Ruby?\nclass Objeto\nend")
    @p4.addr("Una instancia de la clase Class")
    @p4.addr("Una constante")
    @p4.addr("Un objeto")
    @p4.addr("Ninguna de las anteriores")
    
    @p5 = PreguntaS.new("Es apropiado que una clase Tablero herede de una clase Juego")
    @p5.addr("Verdadero")
    @p5.addr("Falso")
    
    @n1 = Nodo.new(@p1)
    @n2 = Nodo.new(@p2)
    @n3 = Nodo.new(@p3)
    @n4 = Nodo.new(@p4)
    @n5 = Nodo.new(@p5)
    
    @lista = Lista.new()
    @lista.addn(@n1)
    @lista.addn(@n2)
    @lista.addn(@n3)
    @lista.addn(@n4)
    @lista.addn(@n5)
    end
end


describe Exam do
    describe 'Lista' do

        before :each do
            @lista = Lista.new()
            @n1 = Nodo.new("Nodo 1")
            @n2 = Nodo.new("Nodo 2")
            @n3 = Nodo.new("Nodo 3")
        end
    
        it 'Debe ser posible insertar nodos en la lista.' do
            @lista.addn(@n1)
            expect(@lista.head).to eq(@n1)
        end
    
        it 'Se pueden insertar varios elementos.' do
            @lista.addn(@n1)
            @lista.addn(@n2)
            expect(@lista.head).to eq(@n2)
            @lista.deln
            expect(@lista.head).to eq(@n1)
        end
    
        it 'Se extrae el primer elemento de la lista.' do
            @lista.addn(@n1)
            @lista.addn(@n2)
            @lista.deln
            expect(@lista.head).to eq(@n1)
        end
        
        it 'Cada nodo apunta a su siguiente y su anterior' do
            @lista.addn(@n1)
            @lista.addn(@n2)
            @lista.addn(@n3)
            expect(@lista.head).to eq(@n3)
            expect(@lista.head.next).to eq(@n2)
            expect(@lista.head.previus).to eq(@n1)
            extra = Nodo.new("EXTRA")
            @lista.addn(extra)
            expect(@lista.head.previus).to eq(@n1)
            expect(@lista.head).to eq(extra)
            expect(@lista.tail).to eq(@n1)

        end
        
        it 'Cada nodo apunta a su siguiente, desde head' do
            @lista.addn(@n1)
            @lista.addn(@n2)
            @lista.addn(@n3)
            extra = Nodo.new("EXTRA")
            @lista.addn(extra)
            
            expect(@lista.head).to eq(extra)
            expect(@lista.head.next).to eq(@n3)
            expect(@lista.head.next.next).to eq(@n2)
            expect(@lista.head.next.next.next).to eq(@n1)
        end
        
        it 'Cada nodo apunta a su anterior, desde tail' do
            @lista.addn(@n1)
            @lista.addn(@n2)
            @lista.addn(@n3)
            extra = Nodo.new("EXTRA")
            @lista.addn(extra)
            expect(@lista.tail.previus.previus.previus).to eq(extra)
            expect(@lista.tail.previus.previus).to eq(@n3)
            expect(@lista.tail.previus).to eq(@n2)
            expect(@lista.tail).to eq(@n1)
        end
    
    end
end

it 'Prueba de pregunta VF' do
	@pregunta = PreguntaVF.new("Esto es una pregunta?")
	expect(@lista.to_s).to eq("Esto es una pregunta?\nVerdadero\nFalso")
end
		   
