class Images < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :path
      t.string :filename

      t.timestamps
    end
  end
end
