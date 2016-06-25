require 'rspec'
require_relative '../model/misil_espacial'
require_relative '../model/nave_espacial'
class MisilSpec
  describe 'Misil' do
    it 'should be not null' do
      mi_nave = MisilEspacial.new(100, 50)
      expect(mi_nave).to be_truthy
    end

    it 'vida should be 50 as efecto destructivo takes 100 on colision' do

      reglas_de_colision_misil = { NaveEspacial => lambda { |x| x.efecto_destructivo(100) }
      }

      mi_misil = MisilEspacial.new(150,50)
      mi_misil.reglas = reglas_de_colision_misil
      mi_misil.resolver_choque_con(NaveEspacial.new(100,100))

      expect(mi_misil.vida).to be(50)

    end
  end
end