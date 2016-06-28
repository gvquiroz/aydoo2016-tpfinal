Final AYDOO - Gabriel Quiroz
===========

> El diseño fue pensado con el fin de soportar fácilmente cambios a las reglas de los objetos galácticos (Como agregar nuevas reglas o modificar las anteriores), la modificación de las propiedades de los objetos galácticos (por ejemplo que nuevos objetos tengan escudo de energía) y que soporte la fácil incorporación de nuevos Elementos espaciales

----------------------
Comentarios sobre el diseño
--------
* Se decidió usar **ducktyping** sobre herencia ya que se consideró que no era totalmente necesario.

* Para los atributos y métodos compartidos por los elementos espaciales se usó un **Mixin** (Propiedades de elementos espaciales), este contiene los efectos que modifican los correspondientes atributos.

* **Árbitro de colisiones** se encarga de enviar los mensajes de choque con sus correspondientes objetos, este se consideró de forma tal que trabaje en conjunto con un Detector de colisiones (Observer - No implementado) que le avise si dos objetos colisionaron y cuales.
Este le envia una copia del objeto con el cual choco al otro objeto (**inmutable**) por seguridad al elemento galáctico
De esta forma nos aseguramos de que cada objeto galáctico use los valores del otro objeto para resolver su choque (con la referencia del mismo) sin poder modificar sus datos

* Cada elemento tiene sus reglas espaciales y sabe resolver su colisión, estas son recibidas por parámetro en la instanciación del mismo. 

* Se utilizó un **Hash** para las reglas espaciales que indica como clave Un tipo de elemento espacial y como valor un comportamiento de lo que debería hacer y que a su vez estas se encuentren centralizadas. A la creación de cada objeto espacial este se instancia con sus propias reglas.

* Hay una **dependencia** directa entre las reglas -> los tipos de elementos espaciales.
Reglas -> los efectos. (Se espera que en el valor de las reglas se haga referencia a un efecto que este en efectos espaciales y el elemento espacial sepa reconocer)

* Se decidio que si dentro de las reglas de cada elemento espacial no esta definida la interaccion, el choque resultara **nulo** para ese objeto.

* Se decidió **unificar** los test de todos los tipos de elementos espaciales en ElementoEspacialSpec ya que no difieren en su comportamiento ni implementación.

* Si el objeto esta muerto no interacciona (Tampoco salta una exception) porque asi fue entendida la consigna


Se consideró
--------

* Se pensó en la posibilidad de usar el patrón de diseño **state** para resolver los Estados de los objetos galácticos pero este fue descartado por el hecho de que sólo contemplaban dos Estados (vivo o muerto)

* Se pensó en la posibilidad de que cada Efecto tenga su clase, pero se descartó al no encontrar ningún beneficio en el diseño llevado a cabo.

* Se tiene en cuenta que el código de los elementos espaciales es el mismo en todos los casos actuales, aun así son representados en clases porque son entidades clave del dominio. También son utilizadas con el fin de diferenciar distintos tipos de elementos del negocio.

* Se tuvo en cuenta **DRY** en el código repetido de los objetos espaciales y se pensó usar herencia para resolverlo pero se consideró que no era una razón lo suficientemente fuerte como para las restricciones que traería usar Herencia. Aun así en el caso de que algún cambio en el futuro haga replantear esta solución se llegó a la conclusión de que sería rápido de resolver.


>Every choice has a price. A good designer understands this tension and minimizes costs by making informed tradeoffs between the needs of the present and the possibilities of the future.  Sandi Metz