class Carts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.float :total

      t.timestamps
    end
  end
end
