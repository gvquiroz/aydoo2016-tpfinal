require 'rspec'
require_relative '../model/nave_espacial'
require_relative '../model/misil_espacial'
class MisilSpec
  describe 'Misil' do
    it 'should be not null' do
      mi_nave = MisilEspacial.new(100, 50)
      expect(mi_nave).to be_truthy
    end

  end
end