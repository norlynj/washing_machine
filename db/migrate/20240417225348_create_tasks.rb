class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :assigned_staff, null: false, foreign_key: true
      t.string :date_range

      t.timestamps
    end
  end
end
