class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity,        :default => 0, :null => false
      t.decimal :price,           :precision => 16, :scale => 2, :null => false
      t.belongs_to :product, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
