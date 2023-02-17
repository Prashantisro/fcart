class ApplicationController < ActionController::Base
 # before_action :authenticate_user!
 protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :current_cart


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :first_name, :last_name,:gender,:user_name, :date_of_birth,:phone_number)
    end
  end


  private
  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
  end
end