class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total,         :precision => 16, :scale => 2, :null => false
      t.integer :item_count,    :null => false
      t.string :currency,       :limit => 3, :default => 'USD', :null => false
      t.string :bill_to,        :limit => 100, :null => false
      t.string :ship_to,        :limit => 100, :null => false
      t.string :order_status,   :limit => 20, :default => 'unfulfilled', :null => false
      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
