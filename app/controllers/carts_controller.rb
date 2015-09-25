class CartsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :authenticate_user, only: :show

  def add_to
    @product = Product.find_by(id: params[:product_id])
    @current_cart.add(@product, params[:quantity].to_i)
    flash[:success] = "#{ @product.title } was added to your shopping cart"

    redirect_to request.env["HTTP_REFERER"]
  end

  def remove_from
    @cart_item = CartItem.find_by(id: params[:cart_item_id])
    @current_cart.remove @cart_item

    redirect_to request.env["HTTP_REFERER"]
  end

  def remove_all_cart_items
    @current_cart.remove_all_cart_items

    redirect_to cart_path(@current_cart)
  end

  def show
    @cart = @current_cart
  end

  def update_cart_items
    @current_cart.update_quantity_cart_items(params[:cart_item])

    redirect_to cart_path(@current_cart)
  end
end
