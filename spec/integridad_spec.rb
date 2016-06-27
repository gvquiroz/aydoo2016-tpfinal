require 'rspec'
require 'spec_helper'
require_relative '../model/ObjetosEspaciales/asteroide_espacial'
require_relative '../model/ObjetosEspaciales/bomba_espacial'
require_relative '../model/ObjetosEspaciales/estrella_espacial'
require_relative '../model/ObjetosEspaciales/misil_espacial'
require_relative '../model/ObjetosEspaciales/nave_espacial'
require_relative '../model/arbitro_de_colisiones'
require_relative '../model/reglas_de_objetos_espaciales'
class IntegridadSpec

  describe "Test de integridad de Viaje espacial" do
    it 'deberia resolver choque entre objeto nave y nave' do
      arbitro = ArbitroDeColisiones.new
      reglas = ReglasDeObjetosEspaciales.new

      mi_nave = NaveEspacial.new(150, 50, reglas.reglas_de_colision)
      otra_nave = NaveEspacial.new(150, 50, reglas.reglas_de_colision)

      arbitro.resolver_colision(mi_nave, otra_nave)
      expect(mi_nave.vida).to be(50)

    end
    it 'una nave choca con un asteroide' do
      arbitro = ArbitroDeColisiones.new
      reglas = ReglasDeObjetosEspaciales.new

      mi_nave = NaveEspacial.new(100, 100, reglas.reglas_de_colision)
      mi_asteroide = AsteroideEspacial.new(50, 100, reglas.reglas_de_colision)

      arbitro.resolver_colision(mi_nave, mi_asteroide)
      expect(mi_nave.masa).to eq(50)
      expect(mi_asteroide.masa).to eq(110)

    end


    it 'una estrella choca con un misil y no pasa nada' do
      arbitro = ArbitroDeColisiones.new
      reglas = ReglasDeObjetosEspaciales.new

      mi_estrella = EstrellaEspacial.new(50, 50, reglas.reglas_de_colision)
      mi_misil = MisilEspacial.new(10, 50, reglas.reglas_de_colision)

      arbitro.resolver_colision(mi_estrella, mi_misil)
      expect(mi_estrella.vida).to eq(50)
      expect(mi_misil.vida).to eq(10)
    end

    it 'una bomba choca con otra bomba' do
      arbitro = ArbitroDeColisiones.new
      reglas = ReglasDeObjetosEspaciales.new

      una_bomba = BombaEspacial.new(200, 90, reglas.reglas_de_colision)
      otra_bomba = BombaEspacial.new(20, 45, reglas.reglas_de_colision)

      arbitro.resolver_colision(una_bomba, otra_bomba)
      expect(una_bomba.vida).to eq(100)
      expect(otra_bomba.vida).to eq(0)
    end

    it 'una nave choca con una estrella' do
      arbitro = ArbitroDeColisiones.new
      reglas = ReglasDeObjetosEspaciales.new

      una_nave = NaveEspacial.new(100, 100, reglas.reglas_de_colision)
      una_estrella = EstrellaEspacial.new(50, 50, reglas.reglas_de_colision)
      arbitro.resolver_colision(una_nave, una_estrella)
      expect(una_nave.vida).to eq(150)
      expect(una_estrella.vida).to eq(0)
    end

  end

end