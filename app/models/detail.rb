class Detail < ApplicationRecord
  belongs_to :user

  # making sure that all entered info is correct by validating the input
  validates :first_name ,:last_name, :street_number, :street_name, :suburb, :postcode, :state, :phone_number, presence: true
  validates :street_number,:postcode, :phone_number, numericality: {only_integer: true}
end
