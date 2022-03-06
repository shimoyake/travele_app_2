class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.string :begin
      t.string :end
      t.string :number_of_peple
      t.integer :user_id
      t.integer :room_id
      t.string :total

      t.timestamps
    end
  end
end
