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

  end
end