class AddInstructionsToOrders < ActiveRecord::Migration[7.1]
  def change
      add_column :orders, :add_instructions, :string
  end
end
