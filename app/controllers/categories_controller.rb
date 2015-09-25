class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(id: params[:id])

    products_filter_order = ProductsFilterOrder.new(ParamsSanitizer.new(category_params).sanitize_all)
    @products = products_filter_order.apply_all_and_paginate
  end

  def category_params
    params.permit(:id, :page, :direction, :sort)
  end
end
