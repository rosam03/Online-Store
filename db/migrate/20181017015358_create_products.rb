class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,              :limit => 30, :default => '', :null => false
      t.decimal :price,            :precision => 16, :scale => 2, :null => false, :default => 0, :null => false
      t.string :currency,          :limit => 3, :default => 'USD', :null => false
      t.integer :quantity,         :default => 0, :null => false
      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
