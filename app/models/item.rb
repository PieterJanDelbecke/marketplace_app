class Item < ApplicationRecord
  belongs_to :user
  has_one :booking

  has_one_attached :picture

  validates :name ,:description, :price, :picture, presence: true

  validates :name, length: { minimum: 10, too_short: "is too short, %{count} characters is the minimum." } 
  validates :description , length: { maximum: 250, too_long: "is too long, %{count} characters is the maximum." }
  validates :price, numericality: {only_integer: true}

  # enum new: { brand_new: 1, second_hand: 0}

end
