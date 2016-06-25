require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/misil_espacial'
class NaveSpec
  describe 'Nave' do
    it 'should be not null' do
      mi_nave = NaveEspacial.new(100,50)
      expect(mi_nave).to be_truthy
    end

=begin
    it 'masa should be 50' do
      mi_nave = NaveEspacial.new(100,50)
      expect(mi_nave.masa).to eq(50)
    end

    it 'vida should be 100 as default' do
      mi_nave = NaveEspacial.new(100,50)
      expect(mi_nave.vida).to eq(100)
    end

    it 'masa should be 50 as default' do
      mi_nave = NaveEspacial.new(100,50)
      expect(mi_nave.masa).to eq(50)
    end
=end

    it 'vida should be 90 as efecto destructivo takes 10 life units' do
      mi_nave = NaveEspacial.new(100,50)
      mi_nave.efecto_destructivo(10)
      expect(mi_nave.vida).to eq_to(90)
    end
    it 'vida should be 110 as efecto constructivo gives 10 life units' do
      mi_nave = NaveEspacial.new(100,50)
      mi_nave.efecto_constructivo(10)
      expect(mi_nave.vida).to eq_to(110)
    end

    it 'masa should be 60 as efecto masa gives 10 masa units' do
      mi_nave = NaveEspacial.new(100,50)
      mi_nave.efecto_masa(10)
      expect(mi_nave.masa).to eq_to(60)
    end

    it 'masa should be 40 as efecto masa gives -10 masa units' do
      mi_nave = NaveEspacial.new(100,50)
      mi_nave.efecto_masa(-10)
      expect(mi_nave.masa).to eq_to(40)
    end

    it 'vida should be 0 as the consequence of colision with NaveEspacial efecto destructivo 100' do

      reglas_de_colision_nave = { NaveEspacial => lambda { |x| x.efecto_destructivo(100) }
      }

      mi_nave = NaveEspacial.new(100,50)
      mi_nave.reglas = reglas_de_colision_nave
      mi_nave.resolver_choque_con(NaveEspacial.new(100,50))
      expect(mi_nave.vida).to be(0)

    end
    it 'vida should be 0 as the consequence of colision with MisilEspacial efecto destructivo 80' do

      reglas_de_colision_nave = { MisilEspacial => lambda { |x| x.efecto_destructivo(80) }
      }

      mi_nave = NaveEspacial.new(100,50)
      mi_nave.reglas = reglas_de_colision_nave
      mi_nave.resolver_choque_con(MisilEspacial.new(100,50))
      expect(mi_nave.vida).to be(20)

    end

  end
end