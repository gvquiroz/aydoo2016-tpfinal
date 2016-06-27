require_relative '../model/propiedades_de_objetos_espaciales'
include PropiedadesDeObjetosEspaciales
class BombaEspacial
  def initialize (vida_inicial,masa_inicial,reglas)
    raise ArgumentError.new('La vida ingresada debe ser positiva') if vida_inicial < 0 || masa_inicial < 0
    @vida = vida_inicial
    @masa = masa_inicial
    @reglas = reglas[self.class]
    @esta_vivo = true
  end
end