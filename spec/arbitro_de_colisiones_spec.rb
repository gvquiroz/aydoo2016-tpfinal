require 'rspec'
require 'spec_helper'
require_relative '../model/nave_espacial'
require_relative '../model/estrella_espacial'
require_relative '../model/arbitro_de_colisiones'
require_relative '../model/misil_espacial'
require_relative '../model/reglas_de_objetos_espaciales'

describe 'ArbitroDeColisiones' do

  it 'mi_nave should destruirse al chocar con otra nave' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new
    mi_nave = NaveEspacial.new(150,50,reglas.reglas_de_colision)
    mi_otra_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_nave.vida).to eq(50)

  end

  it 'mi_otra_nave also should destruirse al chocar con otra nave' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    mi_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)
    mi_otra_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_otra_nave.esta_vivo).to be false

  end

end