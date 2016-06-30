class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, except: [:index, :new, :create]

    before_action :authenticate_admin!, only: [:destroy, :publish, :edit]
  def index

    @articles = Article.paginate(page: params[:page], per_page:5).publicados.ultimos
    @articleslast = Article.publicados.ultimos

  end


  def show
  @article = Article.find(params[:id])
  @article.update_visits_count
  @articles = Article.publicados.vistos
    @articles_limit = Article.publicados.ultimos
  @comment = Comment.new

  @comments = @article.comments.paginate(page: params[:page], per_page: 5).ultimos
  end


def edit


  @genders = Gender.all


end




def new
  @article = Article.new
end

def destroy
  @article.destroy
  respond_to do |format|
    format.html { redirect_to articles_url, notice: 'Articulo eliminado' }
    format.json { head :no_content }
  end
end


def create
  @article = current_user.articles.new(article_params)
  @article.category_ids = params[:categories]
  @article.gender_ids = params[:genders]
  @article.subcategory_ids = params[:subcategories]
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def update


  respond_to do |format|

    if @article.update(article_params) &  @article.category_ids = params[:categories] &  @article.subcategory_ids = params[:subcategories] & @article.gender_ids = params[:genders]

      format.html { redirect_to @article, notice: 'Articulo actualizado' }
      format.json { render :show, status: :ok, location: @article }
    else
      format.html { render :edit }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
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
    params.require(:article).permit(:title, :text, :cover, :categories, :subcategories, :genders, :points, :markup_body)
  end

end
