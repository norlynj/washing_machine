class DropTableName < ActiveRecord::Migration[7.1]
  def up
    drop_table :managers
    drop_table :staffs
    drop_table :payments
    drop_table :invoices
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
