class Cart < ActiveRecord::Base
  has_many :cart_items
  belongs_to :user

  def update(user)
    user_cart = user.cart
    if user_cart
      update_cart_items(user_cart)
    else
      update_attribute(:user_id, user.id)
    end
  end

  def add(product, qty)
    qty = qty.to_i.abs
    if existing_cart_item?(product)
      existing_cart_item =  cart_items.find_by(product_id: product.id)
      new_quantity = existing_cart_item.quantity + qty
      existing_cart_item.update_attribute(:quantity, new_quantity)
    else
      cart_item = cart_items.build(product: product, quantity: qty, title: product.title, price: product.price)
      cart_item.save
    end

    update_total
  end

  def remove(cart_item)
    cart_items.find_by(id: cart_item.id).destroy

    update_total
  end

  def remove_all_cart_items
    cart_items.destroy_all

    update_total
  end

  def update_quantity_cart_items(options)
    cart_items.where(id: options.keys).each do |cart_item|
      value = options[cart_item.id.to_s].to_i.abs
      cart_item.update_attribute(:quantity, value)
    end

    update_total
  end

  def update_total
    total = cart_items.inject(0.00) {|total, cart_item| total + cart_item.price * cart_item.quantity}

    update_attribute(:total, total)
  end

  def validate_quantity
    cart_items.each do |cart_item|
      cart_item.update_if_not_in_stock
    end
    update_total
  end

  def remove_items_from_stock
    cart_items.each do |cart_item|
      cart_item.update_product_stock
    end
  end

  private

  def existing_cart_item?(product)
    cart_items.find_by(product_id: product.id)
  end

  def update_cart_items(user_cart)
    # Merges the current_cart and the user's cart.

    cart_items.each do |cart_item|
      existing_cart_item = user_cart.cart_items.find_by(product_id: cart_item.product_id)

      if existing_cart_item
        existing_cart_item.increment!(:quantity, cart_item.quantity)
      else
        cart_item.update_attribute(:cart_id, user_cart.id)
      end
    end

    user_cart.update_total
  end
end