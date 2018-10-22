class ChangeOrderCustomerInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer_name, :string, :length => 50, :null => false
  end
end
