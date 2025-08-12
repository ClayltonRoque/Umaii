class AddDriverToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :driver_id, :bigint
  end
end
