class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticated_admin

  def index
    products_filter_order = ProductsFilterOrder.new(ParamsSanitizer.new(filter_params).sanitize_all)
    @products = products_filter_order.paginate

    @categories = Category.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.build_image(filename: params[:product][:image])

    if @product.save
      flash[:success] = "Products added successfully."
      redirect_to admin_products_path
    else
      flash.now[:error] = "Please try again."
      render 'new'
    end
  end

  def destroy
    Product.find_by(id: params[:id]).destroy
    flash[:success] = "Product removed successfully."

    redirect_to admin_products_path
  end

  private

  def filter_params
    params.permit(:search, :page, :stock, :category)
  end

  def product_params
    params.require(:product).permit(:title, :category_id, :short_description,
                                    :price, :description, :stock)
  end

  # Before action

  def authenticated_admin
    redirect_to root_path if !current_user || !current_user.is_admin?
  end
end
