class AddRelatedTransactionToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :customer_transaction, foreign_key: true
  end
end
