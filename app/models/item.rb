class Item < ApplicationRecord
  belongs_to :user
  has_one :booking

  has_one_attached :picture

  validates :name ,:description, :price, presence: true

  validates :name, length: { minimum: 10, too_short: "%{count} characters is the minimum required." } 
  validates :description , length: { maximum: 10, too_long: "%{count} characters is the maximum." }
  validates :price, numericality: {only_integer: true}

  # enum new: { brand_new: 1, second_hand: 0}

end
