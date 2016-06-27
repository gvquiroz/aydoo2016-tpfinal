require 'rspec'
require 'spec_helper'
require_relative '../model/nave_espacial'
require_relative '../model/estrella_espacial'
require_relative '../model/arbitro_de_colisiones'
require_relative '../model/misil_espacial'
require_relative '../model/reglas_de_objetos_espaciales'

describe 'ArbitroDeColisiones' do

  it 'mi_nave deberia quedar con 50 de vida al chocar con otra nave con regla efecto destructivo 100' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new
    mi_nave = NaveEspacial.new(150,50,reglas.reglas_de_colision)
    mi_otra_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_nave.vida).to eq(50)

  end

  it 'mi_otra_nave deberia destruirse al chocar con otra nave con efecto destructivo 100' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    mi_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)
    mi_otra_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_otra_nave.esta_vivo).to be false

  end

  it 'mi_otra_nave deberia destruirse al chocarse con un asteroide que disminuye su masa' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    mi_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)
    un_asteroide = AsteroideEspacial.new(100,150,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,un_asteroide)
    expect(mi_nave.esta_vivo).to be false

  end
  it 'mi_otra_nave deberia tener masa 0 al chocarse con un asteroide que disminuye su masa' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    mi_nave = NaveEspacial.new(100,50,reglas.reglas_de_colision)
    un_asteroide = AsteroideEspacial.new(100,150,reglas.reglas_de_colision)

    arbitro.resolver_colision(mi_nave,un_asteroide)
    expect(mi_nave.masa).to eq(0)

  end

end