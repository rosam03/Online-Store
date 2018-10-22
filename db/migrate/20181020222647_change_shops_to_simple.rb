class ChangeShopsToSimple < ActiveRecord::Migration[5.2]
  def change
    remove_column :shops, :phone
  end
end
