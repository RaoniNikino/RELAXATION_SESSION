# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(first_name: 'Sara', last_name: 'Clark', email: 'test@gmail.com', encrypted_password: '123456')
#User.create(first_name: "Med", last_name: "Itation", email: "test2@gmail.com", encrypted_password: "123456")

require "open-uri"

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
adrianne = { first_name: "Adrianne", last_name: "Michler", email: "test@gmail.com", password: "123456" }
med = { first_name: "Med", last_name: "Itation", email: "test2@gmail.com", password: "123456" }
sara = { first_name: "Sara", last_name: "Clark", email: "test3@gmail.com", password: "123456" }

[ adrianne, med, sara ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating offers..."

yoga_camp = URI.open('https://res.cloudinary.com/dhecvnpeh/image/upload/v1646317779/development/Yogacamp_hu6tgk.jpg')
offer = Offer.create(name: "Yoga Camp", category: "Yoga", description: "Yoga offers up a way for us to see a world that is working for you instead of against you. Yoga reminds me that everything is connected so we must live, act, breathe with awareness.", user: User.all.sample)
offer.photo.attach(io: yoga_camp, filename: 'yogacamp.png', content_type: 'image/png')
puts "Created yoga"

mindfulness = URI.open('https://res.cloudinary.com/dhecvnpeh/image/upload/v1646304780/development/moments_ele9lg.jpg')
offer = Offer.create(name: 'Moments of Mindfulness', category: "Meditation", description: "Meditation can be defined as a set of techniques that are intended to encourage a heightened state of awareness and focused attention. Meditation is also a consciousness-changing technique that has been shown to have a wide number of benefits on psychological well-being.", user: User.all.sample)
offer.photo.attach(io: mindfulness, filename: 'mindfulness.png', content_type: 'image/png')
puts "Created meditation"

cool_massage = URI.open('https://res.cloudinary.com/dhecvnpeh/image/upload/v1646304771/development/cool_kcuqwh.jpg')
offer = Offer.create(name: "Cool Massage", category: "Massage", description: "Massage is the rubbing and kneading of muscles and joints of the body with the hands, especially to relieve tension or pain", user: User.all.sample)
offer.photo.attach(io: cool_massage, filename: 'cool massage.png', content_type: 'image/png')
puts "Created maggage"

puts "Finished!"
