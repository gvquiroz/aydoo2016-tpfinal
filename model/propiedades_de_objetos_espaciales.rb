require_relative 'efectos_espaciales.rb'
module PropiedadesDeObjetosEspaciales
  include EfectosEspaciales
  attr_reader :vida, :masa, :esta_vivo, :reglas

  def resolver_choque_con objeto_galactico

    @reglas[objeto_galactico.class].call(self, objeto_galactico) if (@reglas[objeto_galactico.class] && esta_vivo)
    define_estado_muerto

  end

  private
  # Es horrible pero fue dejado asi hasta encontrar una solucion mas elegante
  def define_estado_muerto ()
    if @vida <= 0
      @vida = 0
      @esta_vivo = false
    end
    if @masa <= 0
      @masa = 0
      @esta_vivo = false
    end
  end

end