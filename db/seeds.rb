# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def getName
  name = Faker::Creature::Dog.name.split(" ")[0]
  name.length >= 4 ? name : getName
end

def getBreed
  breeds = [
    "Husky",
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
  ].sample
end

def getBio
  bio = [
    "Hi there! I'm the best dog EVER! WOOF!",
    "Look at me look at me! I'm so prettyyyy!!! BARK BARK",
    "What are you looking at!? I'm not going to eat you! DJEEZ",
    "I'm so so so sweet but I'll drool ALL over you! Sorry not sorry!",
    "Whatever man - I'm the best!"
  ].sample
end

def getPostcode
  postcode = [
    "E14 9GZ",
    "E17 5HL",
    "E17 5JF",
    "E5 9AB",
    "E17 0ZZ",
    "E7 8EW",
    "EC4Y 0DY",
    "EC1P 1EE",
    "EC2Y 9AA",
    "EC1A 1UD",
    "N9 0BG",
    "N8 9NT",
    "N6 6EH",
    "N2 0FA",
    "N19 3YQ"
  ].sample
end

puts "Creating 10 x dogs"

10.times do
  Dog.create(name: getName, breed: getBreed, bio: getBio, location: getPostcode, user: User.find(rand(1..4)))
end

# Need to work out how to create Users in the Seed, rather than manually.
