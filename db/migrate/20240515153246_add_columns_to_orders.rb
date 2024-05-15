class AddColumnsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :weight, :decimal, precision: 10, scale: 2
    add_column :orders, :payment_method, :string
    add_column :orders, :classification, :string
    add_column :orders, :total_amount, :decimal, precision: 10, scale: 2
    add_reference :orders, :staff, foreign_key: { to_table: :users }
  end
end
