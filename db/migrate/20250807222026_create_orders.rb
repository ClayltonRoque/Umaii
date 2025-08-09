class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type_order
      t.text :departure_address, null: false
      t.text :destination_address, null: false
      t.string :order_status
      t.datetime :request_time
      t.datetime :accept_time
      t.datetime :finished_time
      t.decimal :order_value

      t.timestamps
    end
  end
end
