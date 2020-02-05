class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :availabilities
end
