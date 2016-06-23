require 'rspec'
require_relative '../model/nave'
class NaveSpec
  describe 'Nave' do

    it 'should be not null' do
      miNave = Nave.new
      expect(miNave).to be_truthy
    end
  end
end