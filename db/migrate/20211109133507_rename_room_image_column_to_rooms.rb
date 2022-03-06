class RenameRoomImageColumnToRooms < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :room_image, :image
  end
end
