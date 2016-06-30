class GendersController < ApplicationController



  def index


  end


  def show
@gender = Gender.find(params[:id])

@article = Article.last
  end


  def new
    @gender = Gender.new

    @categories = Category.all
  end

  def edit
  end


  def create


@gender =Gender.new(gender_params)

@gender.category_ids = params[:category_id]


if @gender.save
  redirect_to @gender
else
  render 'new'
end
  end



  private


  def gender_params
    params.require(:gender).permit(:name, :category_id)
  end


end
