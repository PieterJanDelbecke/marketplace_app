class Item < ApplicationRecord
  belongs_to :user
  has_one :booking

  enum new: { brand_new: 1, second_hand: 0}

end
