require 'rspec'
require 'spec_helper'
require_relative '../model/nave_espacial'


class ElementoEspacialSpec
describe  do
  it 'should be not null' do
    reglas_de_colision_nave = nil
    reglas = { NaveEspacial.class => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)
    expect(mi_nave).to be_truthy
  end

  it 'vida should be 90 as efecto destructivo takes 10 life units' do
    reglas_de_colision_nave = nil
    reglas = { NaveEspacial.class => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)
    mi_nave.efecto_destructivo(10)
    expect(mi_nave.vida).to eq_to(90)
  end
  it 'vida should be 110 as efecto constructivo gives 10 life units' do
    reglas_de_colision_nave = nil
    reglas = { NaveEspacial.class => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)
    mi_nave.efecto_constructivo(10)
    expect(mi_nave.vida).to eq_to(110)
  end

  it 'masa should be 60 as efecto masa gives 10 masa units' do
    reglas_de_colision_nave = nil
    reglas = { NaveEspacial.class => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)
    mi_nave.efecto_masa(10)
    expect(mi_nave.masa).to eq_to(60)
  end

  it 'masa should be 40 as efecto masa gives -10 masa units' do
    reglas_de_colision_nave = nil
    reglas = { NaveEspacial.class => reglas_de_colision_nave}
    mi_nave = NaveEspacial.new(100, 50,reglas)
    mi_nave.efecto_masa(-10)
    expect(mi_nave.masa).to eq_to(40)
  end
end

end