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


def create
  @article = current_user.articles.new(article_params)

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
