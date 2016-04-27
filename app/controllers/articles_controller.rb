class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index

    @articles = Article.all

  end


  def show
  @article = Article.find(params[:id])

  @comment = Comment.new
  end

def new
  @article = Article.new
end

def destroy
  @article.destroy
  respond_to do |format|
    format.html { redirect_to articles_url, notice: 'Producto eliminado' }
    format.json { head :no_content }
  end
end


def create
  @article = current_user.articles.new(article_params)
  @article.categories = params[:categories]
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end




  private
  def article_params
    params.require(:article).permit(:title, :text, :cover)
  end

end
