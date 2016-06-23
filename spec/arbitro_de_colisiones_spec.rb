require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/estrella_espacial'
require_relative '../model/arbitro_de_colisiones'

describe 'ArbitroDeColisiones' do

  it 'should destruirse' do
    mi_nave = NaveEspacial.new
    mi_estrella = EstrellaEspacial.new
    arbitro = ArbitroDeColisiones.new

    arbitro.resolver_colision(mi_nave,mi_estrella)

    expect(mi_nave.estaVivo?).to be false
  end
end