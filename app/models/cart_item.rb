class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  def update_if_not_in_stock
    if quantity > product.stock
      update_attribute(:quantity, product.stock)
      errors[:quantity] = 'Quantity was exceeding the stock'
    end
  end

  def update_product_stock
    product.decrement!(:stock, quantity)
  end
end
