module PropiedadesDeObjetosEspaciales
  attr_reader :masa,:vida
  def initialize (vida_inicial = 100,masa_inicial = 50)
    @masa = masa_inicial
    @vida = vida_inicial
  end

  def efecto_destructivo cantidad_de_unidades
    @vida -= cantidad_de_unidades
  end
end