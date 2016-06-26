require_relative '../model/propiedades_de_objetos_espaciales'
include PropiedadesDeObjetosEspaciales
class NaveEspacial
  def initialize (vida_inicial,masa_inicial,reglas)
    @vida = vida_inicial
    @masa = masa_inicial
    @reglas = reglas[self.class]
    @esta_vivo = true
  end

end