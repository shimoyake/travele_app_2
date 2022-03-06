class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :introduction
      t.string :room_price
      t.string :room_area
      t.string :address
      t.string :room_image
      t.integer :user_id

      t.timestamps
    end
  end
end
