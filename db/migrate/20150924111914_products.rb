class Products < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :category_id
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
