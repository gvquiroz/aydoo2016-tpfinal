module PropiedadesDeObjetosEspaciales
  attr_reader :masa,:vida
  def initialize (vida_inicial = 100,masa_inicial = 50)
    @masa = masa_inicial
    @vida = vida_inicial
  end
end