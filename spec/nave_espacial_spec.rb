require 'rspec'
require 'spec_helper'
require_relative '../model/nave_espacial'
require_relative '../model/misil_espacial'
require_relative '../model/bomba_espacial'
require_relative '../model/asteroide_espacial'
require_relative '../model/estrella_espacial'

class NaveSpec

  describe 'Nave' do
    it 'should be not null' do
      reglas_de_colision_nave = nil
      reglas = { NaveEspacial.class => reglas_de_colision_nave}
      mi_nave = NaveEspacial.new(100, 50,reglas)
      expect(mi_nave).to be_truthy
    end

    it 'vida should be 90 as efecto destructivo takes 10 life units' do
      reglas_de_colision_nave = nil
      reglas = { NaveEspacial.class => reglas_de_colision_nave}
      mi_nave = NaveEspacial.new(100, 50,reglas)
      mi_nave.efecto_destructivo(10)
      expect(mi_nave.vida).to eq_to(90)
    end
    it 'vida should be 110 as efecto constructivo gives 10 life units' do
      reglas_de_colision_nave = nil
      reglas = { NaveEspacial.class => reglas_de_colision_nave}
      mi_nave = NaveEspacial.new(100, 50,reglas)
      mi_nave.efecto_constructivo(10)
      expect(mi_nave.vida).to eq_to(110)
    end

    it 'masa should be 60 as efecto masa gives 10 masa units' do
      reglas_de_colision_nave = nil
      reglas = { NaveEspacial.class => reglas_de_colision_nave}
      mi_nave = NaveEspacial.new(100, 50,reglas)
      mi_nave.efecto_masa(10)
      expect(mi_nave.masa).to eq_to(60)
    end

    it 'masa should be 40 as efecto masa gives -10 masa units' do
      reglas_de_colision_nave = nil
      reglas = { NaveEspacial.class => reglas_de_colision_nave}
      mi_nave = NaveEspacial.new(100, 50,reglas)
      mi_nave.efecto_masa(-10)
      expect(mi_nave.masa).to eq_to(40)
    end

=begin
    it 'vida should be 0 as the consequence of colision with NaveEspacial efecto destructivo 100' do

      reglas_de_colision_nave = {NaveEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(100) }
      }

      mi_nave = NaveEspacial.new(100, 50,reglas_de_colision_nave)
      mi_nave.resolver_choque_con(NaveEspacial.new(100, 50,reglas_de_colision_nave))
      expect(mi_nave.vida).to be(0)

    end
    it 'vida should be 0 as the consequence of colision with MisilEspacial efecto destructivo 80' do

      reglas_de_colision_nave = {MisilEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(80) }
      }

      mi_nave = NaveEspacial.new(100, 50,reglas_de_colision_nave)
      mi_nave.resolver_choque_con(MisilEspacial.new(100, 50))
      expect(mi_nave.vida).to be(20)

    end

    it 'vida should be 0 as the consequence of colision with BombaEspacial efecto destructivo 50' do

      reglas_de_colision_nave = {BombaEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(50) }
      }

      mi_nave = NaveEspacial.new(100, 50,reglas_de_colision_nave)
      mi_nave.reglas = reglas_de_colision_nave
      mi_nave.resolver_choque_con(BombaEspacial.new(100, 50))
      expect(mi_nave.vida).to be(50)

    end

    it 'masa should be 25 as the consequence of colision with AsteroideEspacial efecto masa' do

      reglas_de_colision_nave = {AsteroideEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_masa(-otro_objeto.masa*0.5) }
      }

      mi_nave = NaveEspacial.new(100, 50,reglas_de_colision_nave)
      mi_nave.reglas = reglas_de_colision_nave
      mi_nave.resolver_choque_con(AsteroideEspacial.new(100, 50))
      expect(mi_nave.masa).to be(25.0)

    end

    it 'vida should be 250 as the consequence of colision with EstrellaEspacial efecto constructivo' do

      reglas_de_colision_nave = {EstrellaEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_constructivo(otro_objeto.vida) }
      }

      mi_nave = NaveEspacial.new(100, 50,reglas_de_colision_nave)
      mi_nave.reglas = reglas_de_colision_nave
      mi_nave.resolver_choque_con(EstrellaEspacial.new(150, 50))
      expect(mi_nave.vida).to be(250)

    end
=end

  end
end