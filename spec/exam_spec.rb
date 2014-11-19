# -*- coding: utf-8 -*-
require "exam"
require 'spec_helper'

describe Exam do
	before :all do
		@p1 = PreguntaS.new("¿Pregunta?", 5)
        @p1.addr("Si.")
        @p1.addr("No.")
	end

	describe 'Seleccion simple' do
		it 'Debe existir una pregunta.' do
			expect(@p1.pr).to eq("¿Pregunta?")
		end
		
		it 'Debe existir un metodo para obtener la pregunta.' do
			expect(@p1.preg).to eq("Pregunta: ¿Pregunta?")
		end

		it 'Deben existir opciones de respuesta(introducir respuesta).' do
			
			expect(@p1.re).not_to be_empty
		end
	
		it 'Se debe invocar a un metodo para obtener las opciones de respuesta.' do
			
			expect(@p1.resp).to eq("1) Si.\n2) No.\n")
		end
	
		it 'Se debe mostrar por consola la pregunta y las opciones de respuesta.' do
			expect(@p1.to_s).to eq("Pregunta: ¿Pregunta?\n\n1) Si.\n2) No.\n")
		end
	end


    it 'Prueba relacion de preguntas' do
    
        @p1 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?", 5)
        @p1.addr("<#Xyz:0xa000208>")
        @p1.addr("nil")
        @p1.addr("0")
        @p1.addr("Ninguna de las anteriores")
    
        @p2 = PreguntaS.new("La siguiente definicion de un hash en ruby es valida:\nhash_raro = {\n[1,2,3] => Object.new(),\nHash.new => :toto", 5)
        @p2.addr("Cierto")
        @p2.addr("Falso")
    
        @p3 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?", 5)
        @p3.addr("1")
        @p3.addr("bob")
        @p3.addr("HEY")
        @p3.addr("Ninguna de las anteriores")
    
        @p4 = PreguntaS.new("Cual es el tipo de objeto en el siguiente codigo Ruby?\nclass Objeto\nend", 5)
        @p4.addr("Una instancia de la clase Class")
        @p4.addr("Una constante")
        @p4.addr("Un objeto")
        @p4.addr("Ninguna de las anteriores")
    
        @p5 = PreguntaS.new("Es apropiado que una clase Tablero herede de una clase Juego", 5)
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
            extra = Nodo.new("EXTRA")
            @lista.addn(extra)
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
    
        it 'Prueba de pregunta VF' do
            @pregunta = PreguntaVF.new("Esto es una pregunta?", 5, "Verdadero")
            expect(@pregunta.to_s).to eq("Esto es una pregunta?\nVerdadero\nFalso")
        end
    end
    
    describe 'Exam practica 8: ' do
        before :each do
            @D5 = PreguntaS.new("Dificultad5", 5)
            @D5_2 = PreguntaS.new("Dificultad5", 5)

            @D2 = PreguntaS.new("Dificultad2", 2)
        end

        describe 'Comparable: ' do
                it "Pregunta D5 debe ser mayor que pregunta D2" do
                        expect(@D5 > @D2).to eq(true)
                end
                
                it "Pregunta D2 debe ser menor que pregunta D5" do
                    expect(@D2 < @D5).to eq(true)
                end
                
                it "Pregunta D5 debe ser igual que pregunta D5_2" do
                    expect(@D5 == @D5_2).to eq(true)
                end
                
        end
        describe 'Enumerable: ' do
            
            before :all do

            @p1 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?", 3)
            @p1.addr("<#Xyz:0xa000208>")
            @p1.addr("nil")
            @p1.addr("0")
            @p1.addr("Ninguna de las anteriores")
        
            @p2 = PreguntaS.new("ZLa siguiente definicion de un hash en ruby es valida:\nhash_raro = {\n[1,2,3] => Object.new(),\nHash.new => :toto", 2)
            @p2.addr("Cierto")
            @p2.addr("Falso")
    
            @p3 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby?", 4)
            @p3.addr("1")
            @p3.addr("bob")
            @p3.addr("HEY")
            @p3.addr("Ninguna de las anteriores")
    
            @p4 = PreguntaS.new("Cual es el tipo de objeto en el siguiente codigo Ruby?\nclass Objeto\nend", 9)
            @p4.addr("Una instancia de la clase Class")
            @p4.addr("Una constante")
            @p4.addr("Un objeto")
            @p4.addr("Ninguna de las anteriores")
    
            @p5 = PreguntaVF.new("Es apropiado que una clase Tablero herede de una clase Juego", 5)
        
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
            
            it "La lista es enumerable" do
                string = ""
                @lista.each do |l| 
                    string << "test"
                    string << "\n" 
                end
                expect(string).to eq("test\n"*5)
            end
            
            it "Cuenta los elementos de la lista" do
                expect(@lista.count).to eq(5)
            end
            
            it "Drop" do
                expect(@lista.drop(5)).to eq([])
            end
            
            it "Find index" do
                expect(@lista.find_index {|i| i.value == @n3.value}).to eq(2)
            end
            
            it "Maximo" do
                expect(@lista.max).to eq(@n4)
            end
            
            it "Minimo" do
                expect(@lista.min).to eq(@n2)
            end
            
        end
    end

    describe 'Exam Practica9' do
        before :all do
            @p1 = PreguntaS.new("Cuanto es 7*3?", 3)
            @p1.addr("16")
            @p1.addr("21")
            @p1.addr("33")
            @p1.addr("15")
            @p1.correcta = 2
            
            @p2 = PreguntaVF.new("¿La siguiente definicion de un hash en ruby es valida?:\nhash_raro = {\n[1,2,3] => Object.new(),\nHash.new => :toto", 2)
            @p2.correcta = 'F'
            
            @p3 = PreguntaS.new("Cual es la salida del siguiente codigo Ruby? puts 'bob'", 4)
            @p3.addr("1")
            @p3.addr("bob")
            @p3.addr("HEY")
            @p3.addr("Ninguna de las anteriores")
            @p3.correcta = 1
            
            @p4 = PreguntaS.new("Cual es el tipo de objeto en el siguiente codigo Ruby?\nclass Objeto\nend", 9)
            @p4.addr("Una instancia de la clase Class")
            @p4.addr("Una constante")
            @p4.addr("Un objeto")
            @p4.addr("Ninguna de las anteriores")
            @p4.correcta = 3
            
            @p5 = PreguntaVF.new("Es apropiado que una clase Tablero herede de una clase Juego", 1)
            @p5.correcta = 'V'
            
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

        it "¿Se puede ordenar una lista?" do
            @lista.ordenar
            expect(@lista.head).to eq(@n5)
            expect(@lista.head.next).to eq(@n2)
            expect(@lista.head.next.next).to eq(@n1)
            expect(@lista.head.next.next.next).to eq(@n3)
            expect(@lista.tail).to eq(@n4)
        end
      
        it "Clase examen, muestra las preguntas en orden" do
            exam = Examen.new(@lista)
            expect(exam.to_s).to eq(@p5.to_s+"\n"+@p2.to_s+"\n"+@p1.to_s+"\n"+@p3.to_s+"\n"+@p4.to_s+"\n")
            
        end
        
        it "Existe y se puede modificar la respuesta correcta" do
            expect(@p1.resp_correcta?("2")).to eq(true)
            expect(@p1.resp_correcta?("3")).to eq(false)
            @p1.correcta = 3
            expect(@p1.resp_correcta?("2")).to eq(false)
            expect(@p1.resp_correcta?("3")).to eq(true)
        end
        
        it "Probando hacer_examen" do
            examen = Examen.new(@lista)
            resps = ['v','f','2','1','3']
            expect(examen.hacer_examen(resps)).to eq(5)
        end
    end
end