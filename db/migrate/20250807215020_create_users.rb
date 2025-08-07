class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_type
      t.binary :user_photo
      t.text :address

      t.timestamps
    end
  end
end
