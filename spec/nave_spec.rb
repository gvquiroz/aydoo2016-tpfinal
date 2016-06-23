require 'rspec'
require_relative '../model/nave'
class NaveSpec
  describe 'Nave' do
    it 'should be not null' do
      miNave = Nave.new(100,50)
      expect(miNave).to be_truthy
    end

    it 'energia should be 50' do
      miNave = Nave.new(100,50)
      expect(miNave.energia).to eq(50)
    end

  end
end