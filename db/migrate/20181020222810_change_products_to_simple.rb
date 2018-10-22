class ChangeProductsToSimple < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :currency
    remove_column :products, :quantity
  end
end
