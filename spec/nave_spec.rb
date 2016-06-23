require 'rspec'
require_relative '../model/nave'
class NaveSpec
  describe 'Nave' do
    it 'should be not null' do
      miNave = Nave.new(100,50)
      expect(miNave).to be_truthy
    end

    it 'masa should be 50' do
      miNave = Nave.new(100,50)
      expect(miNave.masa).to eq(50)
    end

    it 'vida should be 100 as default' do
      miNave = Nave.new()
      expect(miNave.vida).to eq(100)
    end

    it 'masa should be 50 as default' do
      miNave = Nave.new()
      expect(miNave.masa).to eq(50)
    end

    it 'vida should be 90 as efecto destructivo takes 10 life units' do
      miNave = Nave.new()
      miNave.efecto_destructivo(10)
      expect(miNave.vida ).to eq_to(90)
    end
    it 'vida should be 110 as efecto constructivo gives 10 life units' do
      miNave = Nave.new()
      miNave.efecto_constructivo(10)
      expect(miNave.vida ).to eq_to(110)
    end
  end
end