module PropiedadesDeObjetosEspaciales
  attr_reader :masa,:energia
  def initialize (masa_inicial, energia_inicial)
    @masa = masa_inicial
    @energia = energia_inicial
  end
end