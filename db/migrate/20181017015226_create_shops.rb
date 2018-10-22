class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name,         :limit => 50
      t.string :email,        :limit => 50, :null => false
      t.string :phone,        :limit => 20

      t.timestamps
    end
  end
end
