module EfectosEspaciales
  def destruccion_total
    @vida = 0
    @esta_vivo = false
  end

  def efecto_masa cantidad_de_masa
    @masa += cantidad_de_masa
  end

  def efecto_constructivo cantidad_de_unidades
    @vida += cantidad_de_unidades
  end

  def efecto_destructivo cantidad_de_unidades
    @vida -= cantidad_de_unidades
  end
end
