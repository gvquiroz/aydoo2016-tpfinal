class ArbitroDeColisiones

  def resolver_colision (un_objeto, otro_objeto)
    un_objeto.resolver_choque_con(otro_objeto)
    otro_objeto.resolver_choque_con(un_objeto)
  end

end