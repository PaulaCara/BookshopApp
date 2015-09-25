module Admin::ProductsHelper
  def product_availability(stock)
    stock.zero? ? "Out of stock" : stock
  end
end
