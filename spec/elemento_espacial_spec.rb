require 'rspec'
require 'spec_helper'
require_relative '../model/ObjetosEspaciales/nave_espacial'


class ElementoEspacialSpec
describe 'Elemento Espacial como Nave' do
  it 'la instancia de la nave deberia no ser falso ni nil' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    expect(mi_nave).to be_truthy
  end

  it 'vida deberia ser 90 ya que efecto destructivo le quita 10 unidades de vida' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    mi_nave.efecto_destructivo(10)

    expect(mi_nave.vida).to eq_to(90)
  end
  it 'vida deberia ser 110 ya que efecto constructivo le da 10 unidades de vida' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    mi_nave.efecto_constructivo(10)

    expect(mi_nave.vida).to eq_to(110)
  end

  it 'masa deberia ser 60 ya que efecto masa le da 10 unidades de masa' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    mi_nave.efecto_masa(10)

    expect(mi_nave.masa).to eq_to(60)
  end

  it 'masa deberia ser 40 ya que efecto masa le quita 10 unidades de masa' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    mi_nave.efecto_masa(-10)

    expect(mi_nave.masa).to eq_to(40)
  end

  it 'el estado de la nave deberia ser muerto al decirle destruccion total' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)

    mi_nave.destruccion_total

    expect(mi_nave.esta_vivo).to be false
  end

  it 'deberia dar una exception al no poder instancearse con vida negativa el objeto espacial' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}

    expect {(NaveEspacial.new(-100, 50,reglas))}.to raise_error('La vida ingresada debe ser positiva')
  end

  it 'deberia dar una exception al no poder instancearse con masa negativa el objeto espacial' do
    reglas_de_colision_nave = { NaveEspacial => nil }
    reglas = { NaveEspacial => reglas_de_colision_nave}

    expect {(NaveEspacial.new(-00, -50,reglas))}.to raise_error('La vida ingresada debe ser positiva')
  end

end

end