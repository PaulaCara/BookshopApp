class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def search
    products_filter_order = ProductsFilterOrder.new(ParamsSanitizer.new(search_params).sanitize_all)
    @all_products = products_filter_order.search
    @products = products_filter_order.apply_all_and_paginate

    render 'categories/show'
  end

  private

  def search_params
    params.permit(:page, :direction, :sort, :category)
  end
end
