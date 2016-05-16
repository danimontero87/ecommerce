class WelcomeController < ApplicationController
  def index
    @articles = Article.all
    @categories = Category.all
    @products = Product.all
  end

  def unregistered
        @articles = Article.all
        @categories = Category.all
        @products = Product.all


  end

    def payment_succed
      if @shopping_cart.payed?

      cookies[:shopping_cart_id] = nil
      else
      redirect_to carrito_path
    end
  end

end
