require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/estrella_espacial'
class EstrellaEspacialSpec

  describe EstrellaEspacial do
    it 'estaVivo should be false as the consequence of colision with Nave' do
      reglas_de_colision_estrella = {NaveEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.destruccion_total }
      }

      mi_estrella = EstrellaEspacial.new(100, 150)
      mi_estrella.reglas = reglas_de_colision_estrella
      mi_estrella.resolver_choque_con(NaveEspacial.new(150, 100))
      expect(mi_estrella.estaVivo?).to be false
    end
  end

end