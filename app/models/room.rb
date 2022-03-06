class Room < ApplicationRecord
  belongs_to :user
  belongs_to :reserve
  
  mount_uploader :image, ImageUploader
  
  validates :room_name, presence: true
  validates :introduction, presence: true
  validates :room_price, presence: true
  validates :address, presence: true
  validates :image, presence: true
end
