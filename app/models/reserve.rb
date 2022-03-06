class Reserve < ApplicationRecord
  belongs_to :room
  belongs_to:user
  
  validates :begin, presence: true
  validates :end, presence: true
  validates :number_of_peple, presence: true
  
  #日付の逆転
  validate :start_end_check
  
  def start_end_check
    errors.add(:end, "は開始日より前の日付は登録できません。") unless
    self.begin <= self.end
  end
end
