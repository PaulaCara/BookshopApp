class Users::SessionsController < Devise::SessionsController

  def create
    super

    if current_user # updates the cart for an authenticated user if he/she has a cart as an anonymus user
      @current_cart.update(current_user)
      session[:cart_id] = current_user.cart.id if current_user.cart
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_admin?
      admin_products_path
    else
      super
    end
  end
end
