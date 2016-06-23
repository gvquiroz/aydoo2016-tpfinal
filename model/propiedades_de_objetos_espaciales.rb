module PropiedadesDeObjetosEspaciales
  attr_reader :vida,:masa
  def initialize (vida_inicial = 100,masa_inicial = 50)
    @vida = vida_inicial
    @masa = masa_inicial
  end

  def efecto_destructivo cantidad_de_unidades
    @vida -= cantidad_de_unidades
  end

  def efecto_constructivo cantidad_de_unidades
    @vida += cantidad_de_unidades
  end

  def efecto_masa cantidad_de_masa
    @masa += cantidad_de_masa
  end

end