require 'rspec'
require 'spec_helper'
require_relative '../model/nave_espacial'
require_relative '../model/asteroide_espacial'

class AsteroideEspacialSpec
  describe AsteroideEspacial do
    it 'masa should be 160 as the consequence of colision with Nave efecto masa 10%' do
      reglas_de_colision_asteroide = {NaveEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_masa(otro_objeto.masa*0.1) }
      }

      mi_asteroide = AsteroideEspacial.new(100, 150)
      mi_asteroide.reglas = reglas_de_colision_asteroide
      mi_asteroide.resolver_choque_con(NaveEspacial.new(150, 100))
      expect(mi_asteroide.masa).to be(160.0)
    end
  end
end