class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :existing_cart, :get_categories
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def create_cart
    @cart = Cart.new

    if @cart.save
      session[:cart_id] = @cart.id
    end
  end

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
  end

  def current_cart?
    current_cart
  end

  # Before filters

  def existing_cart
    create_cart unless current_cart?
  end

  def get_categories
    @categories = Category.all
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :phone, :gender, :education_id, :username, :firstname, :lastname) }
  end

  def authenticate_user
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to new_user_session_path
    end
  end
end
