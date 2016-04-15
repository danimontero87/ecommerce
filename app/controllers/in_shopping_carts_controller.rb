class InShoppingCartsController < ApplicationController

  def create
    if user_signed_in?

    in_shopping_cart = InShoppingCart.new(product_id: params[:product_id],
                                      shopping_cart: @shopping_cart)

          if in_shopping_cart.save
            redirect_to carrito_path, notice: "Guardamos el producto en tu carrito"
            return
          else

             redirect_to products_path(id: params[:product_id]), notice: "No pudimos agregar al corrito, intentelo de nuevo"
            end
  end

  redirect_to carrito_path, notice: "Te tienes que registrar para poder realizar las compra"


end

  def destroy

    @in_shopping_cart = InShoppingCart.find(params[:id])

    @in_shopping_cart.destroy

    redirect_to carrito_path



  end

end
