class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.datetime :date_time
      t.decimal :amount
      t.string :payment_method
      t.string :order_status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
