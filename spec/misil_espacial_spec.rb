require 'rspec'
require 'spec_helper'
require_relative '../model/misil_espacial'
require_relative '../model/nave_espacial'
require_relative '../model/bomba_espacial'
class MisilSpec
  describe 'Misil' do
    it 'should be not null' do
      mi_nave = MisilEspacial.new(100, 50)
      expect(mi_nave).to be_truthy
    end

    it 'vida should be 50 as efecto destructivo takes 100 on colision with NaveEspacial' do

      reglas_de_colision_misil = { NaveEspacial => lambda { |mi_objeto,otro_objeto| mi_objeto.efecto_destructivo(100) }
      }

      mi_misil = MisilEspacial.new(150,50)
      mi_misil.reglas = reglas_de_colision_misil
      mi_misil.resolver_choque_con(NaveEspacial.new(100,100))

      expect(mi_misil.vida).to be(50)

    end

    it 'vida should be 50 as efecto destructivo takes 100 on colision with Misil' do

      reglas_de_colision_misil = { MisilEspacial => lambda { |mi_objeto,otro_objeto| mi_objeto.efecto_destructivo(100) }
      }

      mi_misil = MisilEspacial.new(200,50)
      mi_misil.reglas = reglas_de_colision_misil
      mi_misil.resolver_choque_con(MisilEspacial.new(100,100))

      expect(mi_misil.vida).to be(100)

    end
    it 'should be the same as the consequence of colision with Bomba is null' do

      reglas_de_colision_misil = { BombaEspacial => lambda { |mi_objeto,otro_objeto|  }
      }

      mi_misil = MisilEspacial.new(200,50)
      mi_misil.reglas = reglas_de_colision_misil
      mi_misil.resolver_choque_con(BombaEspacial.new(100,100))

      expect(mi_misil.vida).to be(200)

    end
  end
end