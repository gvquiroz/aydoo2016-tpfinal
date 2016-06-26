Revisor Alejando Schnidrig
------

1. Mezcla idiomas en el código ingles/español. Deberías elegir 1 de los dos idiomas y usarlo en todo el trabajo practico.

Es tenido en cuenta y sera corregido en los siguientes refactors.

2. Si quiero le puedo setear un numero negativo tanto a la vida como a la masa de algún objeto espacial. Deberías tener eso en cuenta.

Es tenido en cuenta y se le agregara la validacion correspondiente.

3. El arbitro de colisiones debería chequear primero el estado de los objetos espaciales, si alguno de los 2 objetos participes de la colisión no esta vivo no tendría que poder llevarse a cabo la colisión.

Se decidio que si el objeto esta muerto no interacciona (Tampoco salta una exception) porque asi fue entendida la consigna

...  Una vez muerto el objeto ya no participa en ninguna interacción ...

4. Que todos los efectos estén en un modulo no digo que este bien o mal sino que no se si es lo mas claro a la hora de leer el código. En este caso son pocos efectos pero si fueran cientos tendrías que buscar el nombre del efecto por todo el modulo.


