class ReglasDeObjetosEspaciales
  attr_reader :reglas_de_colision_nave
  def initialize
    @reglas_de_colision_nave = {NaveEspacial.class => self.destruccion_total,
                                EstrellaEspacial.class => self.destruccion_total}

  end

  def get_reglas
    @reglas_de_colision_nave
  end

end