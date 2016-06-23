module PropiedadesDeObjetosEspaciales

  attr_reader :vida,:masa,:esta_vivo
  def initialize (vida_inicial = 100,masa_inicial = 50)
    @vida = vida_inicial
    @masa = masa_inicial
    @esta_vivo = true
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

  def destruccion_total
    @esta_vivo = false
  end

  def estaVivo?
    @esta_vivo
  end

  def resolver_choque_con objeto_galactico
    reglas_espaciales = {EstrellaEspacial.class => self.destruccion_total,
                          NaveEspacial.class => self.efecto_constructivo(10)}
    reglas_espaciales[objeto_galactico.class]
  end

end