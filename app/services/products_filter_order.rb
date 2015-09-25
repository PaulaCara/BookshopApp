class ProductsFilterOrder
  def initialize(params)
    @params = params
    @products = Product
  end

  def filter
    filter_by_category
  end

  def apply_all
    filter
    order

    @products
  end

  def apply_all_and_paginate
    apply_all
    paginate
  end

  def paginate
    @products = @products.paginate(page: 1, per_page: 9)

    @params[:page] = 1 unless (1..@products.total_pages).include?(@params[:page].to_i)
    @products = @products.page(@params[:page])
  end

  def filter_by_category
    @category = @params[:category] || @params[:id]
    @products = @products.where(category_id: @category ) if @category
  end

  def order
    @order_by = "#{ @params[:sort] } #{ @params[:direction] }"
    @products = @products.order(@order_by)
  end
end
