class RemoveObsoleteColumnFromCustomerTransactions < ActiveRecord::Migration[7.1]
  def change
    remove_column :customer_transactions, :date_time
    remove_column :customer_transactions, :amount
    remove_column :customer_transactions, :payment_method
    remove_column :customer_transactions, :order_status
    # Remove any other unwanted columns here

    # Add the desired columns
    add_column :customer_transactions, :order_id, :integer
    add_column :customer_transactions, :receipt, :string
  end
end
