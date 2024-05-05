class CreateSalesAnalytics < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_analytics do |t|

      t.timestamps
    end
  end
end
