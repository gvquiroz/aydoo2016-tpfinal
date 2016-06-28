###Revisor Alejando Schnidrig

 1.  Mezcla idiomas en el código ingles/español. Deberías elegir 1 de los dos idiomas y usarlo en todo el trabajo práctico.
 2.   Si quiero le puedo setear un número negativo tanto a la vida como a la masa de algún objeto espacial. Deberías tener eso en cuenta.
 3. El árbitro de colisiones debería chequear primero el estado de los objetos espaciales, si alguno de los 2 objetos partícipes de la colisión no está vivo no tendría que poder llevarse a cabo la colisión.
 4. Que todos los efectos estén en un módulo no digo que este bien o mal sino que no se si es lo más claro a la hora de leer el código. En este caso son pocos efectos pero si fueran cientos tendrías que buscar el nombre del efecto por todo el módulo.

###Respuesta

 1. Es tenido en cuenta y será corregido en los siguientes refactors.
 2. Es tenido en cuenta y se le agregara la validación correspondiente.
 3. Se decidió que si el objeto está muerto no interacciona (Tampoco salta una excepcion) porque así fue entendida la consigna ... Una vez muerto el objeto ya no participa en ninguna interacción …
 4. Si bien fue pensado de esa forma, ya que los efectos interactúan con los atributos del mismo, se siguió la recomendación y se refactorizaron los métodos a otro modulo (EfectosEspaciales).  Incluso luego de reflexión se piensa que se dividen mejor las responsabilidades de esta forma.