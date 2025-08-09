class AddDescriptionItemsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :description_items, :text
  end
end
