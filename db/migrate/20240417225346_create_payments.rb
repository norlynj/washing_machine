class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.datetime :date_time
      t.decimal :total_amount
      t.string :payment_method
      t.string :payment_status

      t.timestamps
    end
  end
end
