require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/estrella_espacial'
require_relative '../model/arbitro_de_colisiones'
require_relative '../model/reglas_de_objetos_espaciales'

describe 'ArbitroDeColisiones' do

=begin
  it 'should destruirse' do
    reglas = ReglasDeObjetosEspaciales.new
    mi_nave = NaveEspacial.new(100,50)
    mi_estrella = EstrellaEspacial.new(100,50)
    arbitro = ArbitroDeColisiones.new

    arbitro.resolver_colision(mi_nave,mi_estrella)

    expect(mi_nave.estaVivo?).to be false
  end
  it 'estrella should increase vida 10 unit points' do
    reglas = ReglasDeObjetosEspaciales.new
    mi_nave = NaveEspacial.new(100,50)
    mi_estrella = EstrellaEspacial.new(100,50)
    arbitro = ArbitroDeColisiones.new

    arbitro.resolver_colision(mi_nave,mi_estrella)

    expect(mi_estrella.estaVivo?).to be false
  end
=end

  it 'mi_nave should destruirse al chocar con otra nave' do

    reglas_de_colision_nave = {NaveEspacial => Proc.new { |x| x.destruccion_total },
                EstrellaEspacial => 3
    }

    arbitro = ArbitroDeColisiones.new
    mi_nave = NaveEspacial.new(100,50)
    mi_otra_nave = NaveEspacial.new(100,50)
    mi_otra_nave.reglas =reglas_de_colision_nave

    mi_nave.reglas = reglas_de_colision_nave
    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_nave.estaVivo?).to be false

  end

  it 'mi_otra_nave also should destruirse al chocar con otra nave' do

    reglas_de_colision_nave = {NaveEspacial => Proc.new { |x| x.destruccion_total }
    }
    arbitro = ArbitroDeColisiones.new

    mi_nave = NaveEspacial.new(100,50)
    mi_otra_nave = NaveEspacial.new(100,50)
    mi_otra_nave.reglas =reglas_de_colision_nave

    mi_nave.reglas = reglas_de_colision_nave
    arbitro.resolver_colision(mi_nave,mi_otra_nave)
    expect(mi_otra_nave.estaVivo?).to be false

  end

end