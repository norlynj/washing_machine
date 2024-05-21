class AddDetergentsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :detergent, :integer
  end
end
