class WelcomeController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]
  def index
    @articles = Article.publicados.ultimos.limit(4)
    @categories = Category.all
    @products = Product.last(12)
    @article = Article.last

  end

  def unregistered
        @articles = Article.publicados.ultimos.limit(4)
        @categories = Category.all
        @products = Product.last(12)
          @article = Article.last
  end

def dashboard
    @articles = Article.all

end
    def payment_succed
      if @shopping_cart.payed?

      cookies[:shopping_cart_id] = nil
      else
      redirect_to carrito_path
    end
  end

end
