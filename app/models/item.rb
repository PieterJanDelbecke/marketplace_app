class Item < ApplicationRecord
  belongs_to :user
  has_one :booking

  # associated the picture with the Item when using Active Storage
  has_one_attached :picture

  # validating of the data entry when a new item gets listed 
  validates :name ,:description, :price, :picture, presence: true

  validates :name, length: { minimum: 10, too_short: "is too short, %{count} characters is the minimum." } 
  validates :description , length: { in: 100..400 }
  validates :price, numericality: {only_integer: true}

end
