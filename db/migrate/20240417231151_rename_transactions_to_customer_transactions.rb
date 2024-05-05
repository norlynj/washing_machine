class RenameTransactionsToCustomerTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_table :transactions, :customer_transactions
  end
end
