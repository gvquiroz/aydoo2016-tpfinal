module PropiedadesDeObjetosEspaciales
  attr_reader :vida,:masa,:esta_vivo,:reglas

  def resolver_choque_con objeto_galactico
    @reglas[objeto_galactico.class].call(self,objeto_galactico)
    if self.vida <= 0
      @vida = 0
      @esta_vivo = false
    end
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
    @vida = 0
    @esta_vivo = false
  end

end