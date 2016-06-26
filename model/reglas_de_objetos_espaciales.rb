require_relative '../model/nave_espacial'
require_relative '../model/bomba_espacial'
require_relative '../model/estrella_espacial'
require_relative '../model/arbitro_de_colisiones'
require_relative '../model/misil_espacial'
require_relative '../model/asteroide_espacial'

class ReglasDeObjetosEspaciales
  attr_accessor :reglas_de_colision

  def initialize
    reglas_de_colision_nave = {
        NaveEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) },
        MisilEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(80) },
        BombaEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(50) },
        AsteroideEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_masa(-otro_objeto.masa*0.5) },
        EstrellaEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_constructivo(otro_objeto.vida) }
    }

    reglas_de_colision_asteroide = {
        NaveEspacial => lambda { |mi_objeto, otro_objeto| mi_objeto.efecto_masa(otro_objeto.masa*0.1) }
    }

    reglas_de_colision_estrella = {
        NaveEspacial => lambda { |mi_objeto, _| mi_objeto.destruccion_total },
        BombaEspacial => lambda { |mi_objeto, _| mi_objeto.destruccion_total },
        AsteroideEspacial => lambda { |mi_objeto, _| mi_objeto.destruccion_total },
        EstrellaEspacial => lambda { |mi_objeto, _| mi_objeto.destruccion_total }
    }

    reglas_de_colision_misil = {
        NaveEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) },
        MisilEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) },
    }

    reglas_de_colision_bomba = {
        NaveEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) },
        MisilEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(mi_objeto.vida/2) },
        BombaEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) },
        AsteroideEspacial => lambda { |mi_objeto, _| mi_objeto.destruccion_total },
        EstrellaEspacial => lambda { |mi_objeto, _| mi_objeto.efecto_destructivo(100) }
    }

    @reglas_de_colision = {NaveEspacial => reglas_de_colision_nave,
                           AsteroideEspacial => reglas_de_colision_asteroide,
                           EstrellaEspacial => reglas_de_colision_estrella,
                           MisilEspacial => reglas_de_colision_misil,
                           BombaEspacial => reglas_de_colision_bomba
    }
  end

end