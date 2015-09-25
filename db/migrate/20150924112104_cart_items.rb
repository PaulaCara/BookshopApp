class CartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.string :title
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
