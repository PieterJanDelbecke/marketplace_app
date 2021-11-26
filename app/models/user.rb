class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  
  has_one :detail

  # makes that the data for the detail table is being passed on when signing up with Devise
  accepts_nested_attributes_for :detail

  #associations between the tables
  has_many :items
  has_many :orders

end
