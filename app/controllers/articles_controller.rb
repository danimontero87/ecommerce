class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, except: [:index, :new, :create]

    before_action :authenticate_admin!, only: [:destroy, :publish]
  def index

    @articles = Article.paginate(page: params[:page], per_page:5).publicados.ultimos
    @articleslast = Article.publicados.ultimos

  end


  def show
  @article = Article.find(params[:id])
    @articles = Article.all
  @comment = Comment.new
  end


def edit

  @article = Article.find(params[:id])
  
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

def update

  if @article.update(article_params)
    redirect_to @article
  else
    render :edit
  end
end

def publish

  @article.publish!

  redirect_to @article

end



  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :cover, :categories)
  end

end
