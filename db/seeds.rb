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

User.create!(email: 'jonas.vanbuel@gmail.com', password: 'dawgrentals', password_confirmation: 'dawgrentals')
User.create!(email: 'jamie.s.a.reynolds@gmail.com', password: 'dawgrentals', password_confirmation: 'dawgrentals')
User.create!(email: 'hello@sophiearcher.co.uk', password: 'dawgrentals', password_confirmation: 'dawgrentals')
User.create!(email: 'tom_poulter_02@hotmail.com', password: 'dawgrentals', password_confirmation: 'dawgrentals')

puts "Created 4 users"

50.times do
  Dog.create(
    name: getName,
    breed: getBreed,
    bio: getBio,
    location: getPostcode,
    user: User.find(rand(1..4)),
    img_url: "https://source.unsplash.com/800x600/?dog"
  )
end

puts "Created 50 dogs"
puts "Seed completed"
