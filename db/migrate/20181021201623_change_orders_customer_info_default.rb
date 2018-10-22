class ChangeOrdersCustomerInfoDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :customer_name, :string, :length => 50, :default => ""
  end
end
