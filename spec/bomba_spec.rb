require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/misil_espacial'
require_relative '../model/bomba_espacial'
require_relative '../model/asteroide_espacial'
require_relative '../model/estrella_espacial'

class BombaSpec
  describe 'BombaEspacial' do
    it 'vida should be 0 as the consequence of colision with NaveEspacial efecto destructivo 100' do

      reglas_de_colision_bomba = {NaveEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(100) }
      }

      mi_bomba = BombaEspacial.new(150, 50)
      mi_bomba.reglas = reglas_de_colision_bomba
      mi_bomba.resolver_choque_con(NaveEspacial.new(100, 50))
      expect(mi_bomba.vida).to be(50)

    end
    it 'vida should be 75 as the consequence of colision with Misil efecto destructivo 50%' do

      reglas_de_colision_bomba = {MisilEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(mi_objeto.vida/2) }
      }

      mi_bomba = BombaEspacial.new(150, 50)
      mi_bomba.reglas = reglas_de_colision_bomba
      mi_bomba.resolver_choque_con(MisilEspacial.new(100, 50))
      expect(mi_bomba.vida).to be(75)

    end
    it 'vida should be 50 as the consequence of colision with Bomba efecto destructivo 100' do

      reglas_de_colision_bomba = {BombaEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_destructivo(100) }
      }

      mi_bomba = BombaEspacial.new(150, 50)
      mi_bomba.reglas = reglas_de_colision_bomba
      mi_bomba.resolver_choque_con(BombaEspacial.new(100, 50))
      expect(mi_bomba.vida).to be(50)

    end
  end
end