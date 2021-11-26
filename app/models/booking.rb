class Booking < ApplicationRecord
  # associations between the tables
  belongs_to :item
  belongs_to :user
end
