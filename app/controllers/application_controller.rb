class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_shopping_cart
  before_action :set_categories
  before_action :set_subcategories

  # Prevent CSRF attacks by raising an exception.
   # For APIs, you may want to use :null_session instead.
   before_filter :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :name, :email, :password, :password_confirmation) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :name, :email, :password, :password_confirmation, :current_password) }

   end


def authenticate_editor!
redirect_to root_path unless user_signed_in? && current_user.is_editor?
end

def authenticate_admin!
redirect_to root_path unless user_signed_in? && current_user.is_admin?
end

  private

  def set_categories
    @Categories = Category.all
  end

  def set_subcategories
    @subcategories = Subcategory.all
  end

  def set_shopping_cart

    if  cookies[:shopping_cart_id].blank?
    @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)

    cookies[:shopping_cart_id] = @shopping_cart.id
  else
    @shopping_cart =ShoppingCart.find(cookies[:shopping_cart_id])

    end

  rescue ActiveRecord::RecordNotFound => e
    @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
    cookies[:shopping_cart_id] = @shopping_cart.id
  end
end
