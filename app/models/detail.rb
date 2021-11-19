class Detail < ApplicationRecord
  belongs_to :user

  validates :first_name ,:last_name, :street_number, :street_name, :suburb, :postcode, :state, :phone_number, presence: true
  validates :street_number,:postcode, :phone_number, numericality: {only_integer: true}
end
