require 'faker'
require "open-uri"

# USERS

User.create!(
  name: "Jonas Vanbuel",
  email: 'jonas.vanbuel@gmail.com',
  password: 'dawgrentals',
  password_confirmation: 'dawgrentals')

User.create!(
  name: "Jamie Reynolds",
  email: 'jamie.s.a.reynolds@gmail.com',
  password: 'dawgrentals',
  password_confirmation: 'dawgrentals')

User.create!(
  name: "Sophie Archer",
  email: 'hello@sophiearcher.co.uk',
  password: 'dawgrentals',
  password_confirmation: 'dawgrentals')

User.create!(
  name: "Tom Poulter",
  email: 'tom_poulter_02@hotmail.com',
  password: 'dawgrentals',
  password_confirmation: 'dawgrentals')

puts "Created 4 users..."


# DOGS

def getName
  name = Faker::Creature::Dog.name.split(" ")[0]
  name.length >= 4 ? name : getName
end

def getBio
  [
    "Hi there! I'm the best dog EVER! WOOF! 🐶 Also there's no need to walk me, I can walk myself! Grrrr",
    "Look at me look at me! 🐶 I'm so prettyyyy!!! BARK BARK You'll get so much attention walking me! WOOF 😘",
    "Oh boy I'm just so so SOOO hungry all the time! Be prepared to feed me hourly! 🦴",
    "I'm so very sweet but that also means I'll drool ALL over you! 🤤🤤🤤 Sorry not sorry!",
    "What are you looking at!? ",
    "If not now, then when? If not you, then who? 🤷‍♀️ Get off the sofa, stop watching Netflix and TALK ME FOR A WALK FOR CRYING OUT LOUD! 😢",
  ].sample
end

data_sets = [
  ["Husky", "N1 5JR", "https://www.thesprucepets.com/thmb/XG1fd4hJoDMLJOZE9B5Zdw5YWd0=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/husky-dog-lying-in-the-915124768-34493760df9648f99961b50a16c39529.jpg"],
  ["Jack Russel", "N1 5LH", "https://www.loveyourdog.com/wp-content/uploads/2019/04/jack-russell-terrier.jpg"],
  ["Doberman", "E2 8LG", "https://cdn3-www.dogtime.com/assets/uploads/gallery/doberman-pinscher-dog-breed-pictures/doberman-pinscher-dog-breed-pictures-1.jpg"],
  ["Dachshund (sausage dog)", "E2 8HZ", "https://thehappypuppysite.com/wp-content/uploads/2018/12/fat-dachshund-long.jpg"],
  ["Weimaraner", "E2 8LR", "https://www.pets4homes.co.uk/images/articles/3273/large/a-feeding-guide-for-weimaraners-56240dc3b28a2.jpg"],
  ["Welsh Terrier", "E2 8BA", "https://img.dog-learn.com/dog-breeds/welsh-terrier/welsh-terrier-i1-sz6.jpg"],
  ["Cavachon", "E2 8NA", "https://www.pets4homes.co.uk/images/breeds/302/large/4c31ba2353fbcf3e10ae39ddc5bb5061.jpg"],
  ["Dandie Dinmont Terrier", "E2 7QG", "https://www.pets4homes.co.uk/images/breeds/85/large/c8cb758a445c4bb2690c4c8b7c994a5b.jpg"],
  ["Labradoodle", "N1 6SG", "https://media.gq.com/photos/5d8b7d81b14b3a000878599a/1:1/w_3003,h_3003,c_limit/GettyImages-579267034.jpg"],
  ["Miniature Schnauzer", "E2 8EA", "https://thehappypuppysite.com/wp-content/uploads/2019/07/Teacup-Schnauzer-HP-long.jpg"],
  ["Flat-coated Retriever", "N1 6LD", "https://img.dog-learn.com/dog-breeds/flat-coated-retriever/flat-coated-retriever-i1-sz6.jpg"],
  ["Golden Retriever", "E2 8AG", "https://upload.wikimedia.org/wikipedia/commons/9/93/Golden_Retriever_Carlos_%2810581910556%29.jpg"],
  ["German Shepherd", "E2 8EX", "https://cdn.orvis.com/images/DBS_GermanShep_1280.jpg"],
  ["Border Collie", "E8 4FE", "https://barkpost.com/wp-content/uploads/2019/05/border-collie-puppy.jpg"],
  ["Boxer", "E8 4DY", "https://thehappypuppysite.com/wp-content/uploads/2017/11/The-Boxer-Dog-HP-long.jpg"],
  ["Cocker Spaniel", "N1 5RY", "https://i.ebayimg.com/00/s/NzMxWDEwMjQ=/z/feoAAOSwm5xcPOg-/$_86.JPG"],
  ["Springer Spaniel", "E8 4DS", "https://upload.wikimedia.org/wikipedia/commons/a/ab/Welsh_Springer_Spaniel_1.jpg"],
  ["Labrador Retriever", "N1 5AQ", "https://www.pets4homes.co.uk/images/breeds/11/large/54a687ba510d43c0f7759831b7a5bde1.jpg"],
  ["Cockapoo", "E8 4NT", "https://thehappypuppysite.com/wp-content/uploads/2018/05/best-toys-for-cockapoo-header.jpg"],
  ["Staffordshire Bull Terrier (staffie)", "E2 8QS", "https://cdn.britannica.com/01/198001-050-AC33057E/ancestry-American-Staffordshire-Terrier-bulldogs-Staffie-mastiffs.jpg"]
]

data_sets.each do |data_set|
  new_dog = Dog.new(
    name: getName,
    breed: data_set[0],
    bio: getBio,
    location: data_set[1],
    user: User.find(rand(1..4)),
  )
  # Attach photograph
  image = URI.open("#{data_set[2]}")
  new_dog.photo.attach(io: image, filename: "#{new_dog.name}.jpg", content_type: 'image/png')
  # Save dog
  new_dog.save
end

puts "Created 20 dogs..."


# 2 bookings per user?

puts "Seed completed!"
