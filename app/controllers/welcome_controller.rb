class WelcomeController < ApplicationController
    before_action :authenticate_user!, only: [:dashboard]
  def index
    @articles = Article.publicados.vistos.limit(4)
    @articles_limit = Article.publicados.ultimos.limit(6)
    @categories = Category.all
    @products = Product.last(6)
      @article = Article.publicados.last

      @genders = Gender.all
  end

  def unregistered
        @articles = Article.publicados.vistos.limit(4)
        @articles_limit = Article.publicados.ultimos.limit(6)
        @categories = Category.all
        @products = Product.last(6)
          @article = Article.publicados.last
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
