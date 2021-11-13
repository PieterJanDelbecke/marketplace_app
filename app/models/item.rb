class Item < ApplicationRecord
  belongs_to :user
  has_one :booking

  has_one_attached :picture

  enum new: { brand_new: 1, second_hand: 0}

end
