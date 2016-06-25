require_relative '../model/propiedades_de_objetos_espaciales'
include PropiedadesDeObjetosEspaciales
class BombaEspacial
  def initialize (vida_inicial, masa_inicial)
    @vida = vida_inicial
    @masa = masa_inicial
    @esta_vivo = true
  end
end