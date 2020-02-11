class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many :availabilities
  has_one_attached :photo
  validates :name, :breed, :bio, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

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
