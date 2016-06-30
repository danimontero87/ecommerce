class ProfileController < ApplicationController
  def index

    @user = User.find(current_user)
  end

  def show
    @user = User.find(current_user)
    @user.profile ||= Profile.new
    @profile = @user.profile

  end

  def update
#@profile =  Profile.find(current_user)
  if  @user = User.find(current_user)

                respond_to do |format|

                  if  current_user.update_attributes(name: user_params[:name]) & current_user.profile.update_attributes(user_params)
                    format.html {redirect_to @user, notice:  "Datos actualizados"}
                  else
                    format.html {render action:  "show"}
                  end
                end
  else
    @profile = Profile.new
    @profile.save
  end
end

  private

  def user_params
       params.require(:profile).permit(:name, :last_name, :birth_date, :city)
     end
end
