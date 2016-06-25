Final AYDOO
===========

> El diseño fue pensado con el fin de soportar fácilmente cambios a las reglas de los objetos galácticos (Como agregar nuevas reglas o modificar las anteriores), la modificación de las propiedades de los objetos galácticos (por ejemplo que nuevos objetos tengan escudo de energía) y que soporte la fácil incorporación de nuevos Elementos espaciales

----------------------

* Se decidió usar **ducktyping** sobre herencia ya que se consideró que no era totalmente necesario.

* Para los atributos y métodos compartidos por los elementos espaciales se usó un **Mixin** (Propiedades de elementos espaciales), este contiene los efectos que modifican los correspondientes atributos.

* **Árbitro de colisiones** se encarga de enviar los mensajes de choque con sus correspondientes objetos, este se consideró de forma tal que trabaje en conjunto con un Detector de colisiones (Observer - No implementado) que le avise si dos objetos colisionaron y cuales.

* Cada elemento tiene sus reglas espaciales y sabe resolver su colisión, estas son recibidas por parámetro en la instanciación del mismo. 

* [ Pensando usar un Elemento espacial factory para instanciar las naves con sus respectivas reglas ]

* Se utilizó un **Hash** para las reglas espaciales que indica como clave Un tipo de elemento espacial y como valor lo que el elemento afectado debería hacer.

Se consideró
--------
* Volver un al objeto pasado por el árbitro de colisiones **inmutable** o pasarle una copia del objeto por seguridad al elemento galáctico
De esta forma nos aseguramos de que cada objeto galáctico use el otro objeto para resolver su choque (con la referencia del mismo) sin poder modificar sus datos

* Hacer los métodos sobre los efectos (En las Propiedades de los objetos espaciales) **privados** siendo asi solo resolverChoque tendría que poder acceder a ellos para que los mismos objetos espaciales no puedan aplicarse efectos sobre sí mismos. 

* Se pensó en la posibilidad de usar el patrón de diseño **state** para resolver los Estados de los objetos galácticos pero este fue descartado por el hecho de que sólo contemplaban dos Estados (vivo o muerto)

* Se pensó en la posibilidad de que cada Efecto tenga su clase, pero se descartó al no encontrar ningún beneficio en el diseño llevado a cabo.

