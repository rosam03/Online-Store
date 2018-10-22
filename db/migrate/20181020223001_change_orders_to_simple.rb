class ChangeOrdersToSimple < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :item_count
    remove_column :orders, :currency
    remove_column :orders, :bill_to
    remove_column :orders, :ship_to
    remove_column :orders, :order_status
  end
end
