module ProductsHelper

  def format_price(number)
    #Formats a number with 2 decimals
    "£" + number_with_precision(number, :precision => 2)
  end

  def availability(stock)
    stock.zero? ? "Out of stock" : "In stock"
  end

  def image_for(product)
    Rails.application.assets.find_asset(product.image[:filename]).nil? ? "default_book_cover.jpg" : product.image[:filename]
  end

end
