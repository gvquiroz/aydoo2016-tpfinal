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

  it 'un misil deberia tener masa 50 al chocarse con otro misil que disminuye su vida en 100' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    un_misil = MisilEspacial.new(150,50,reglas.reglas_de_colision)
    otro_misil = MisilEspacial.new(100,150,reglas.reglas_de_colision)

    arbitro.resolver_colision(un_misil,otro_misil)
    expect(un_misil.vida).to eq(50)

  end

  it 'una bomba deberia tener masa 50 al chocarse con otro misil que disminuye su vida en 100' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    una_nave = NaveEspacial.new(150,50,reglas.reglas_de_colision)
    una_bomba = BombaEspacial.new(150,150,reglas.reglas_de_colision)

    arbitro.resolver_colision(una_nave,una_bomba)
    expect(una_bomba.vida).to eq(50)

  end

  it 'una estrella deberia tener estar muerta al chocarse con una bomba por destruccion total' do

    reglas = ReglasDeObjetosEspaciales.new
    arbitro = ArbitroDeColisiones.new

    una_estrella = EstrellaEspacial.new(150,50,reglas.reglas_de_colision)
    una_bomba = BombaEspacial.new(150,150,reglas.reglas_de_colision)

    arbitro.resolver_colision(una_estrella,una_bomba)
    expect(una_estrella.esta_vivo).to be false

  end

end