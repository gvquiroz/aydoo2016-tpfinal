class ArbitroDeColisiones

  def resolver_colision (primer_objeto, segundo_objeto)
    copiaDelPrimerObjeto = primer_objeto.dup
    copiaDelSegundoObjeto = segundo_objeto.dup

    primer_objeto.resolver_choque_con(copiaDelSegundoObjeto)
    segundo_objeto.resolver_choque_con(copiaDelPrimerObjeto)
  end

end