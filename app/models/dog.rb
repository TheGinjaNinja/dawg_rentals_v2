class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :availabilities
  has_one_attached :photo
  validates :name, :breed, :bio, presence: true

  CATEGORIES = ["Husky",
    "Jack Russel",
    "Doberman Pincher",
    "Dachshund (sausage dog)",
    "Weimaraner",
    "Welsh Terrier",
    "Cavachon",
    "Dandie Dinmont Terrier",
    "Labradoodle",
    "Miniature Schnauzer",
    "Flat-coated Retriever",
    "Golden Retriever",
    "German Shepherd",
    "Border Collie",
    "Boxer",
    "Cocker Spaniel",
    "Springer Spaniel",
    "Labrador Retriever",
    "Cockapoo",
    "Staffordshire Bull Terrier (staffie)"
  ]
end
