class CreateInventory < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.string :name

      t.timestamps
    end
  end
end
