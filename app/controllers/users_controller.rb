class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @users = User.all
    @profiles =  Profile.all
    @user = User.find(current_user)
  end

  def show
    @user = User.find(params[:id])
    @profiles =  Profile.all
  end

  def destroy

  end

  def edit

  end
end
