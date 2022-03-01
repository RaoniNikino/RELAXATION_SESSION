# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create(first_name: 'Sara', last_name: 'Clark', email: 'test@gmail.com', encrypted_password: '123456')
#User.create(first_name: "Med", last_name: "Itation", email: "test2@gmail.com", encrypted_password: "123456")

puts "Cleaning database..."
User.destroy_all

puts "Creating users..."
sara = { first_name: 'Sara', last_name: 'Clark', email: 'test@gmail.com', password: '123456' }
med =  { first_name: "Med", last_name: "Itation", email: "test2@gmail.com", password: "123456" }

[ sara, med ].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end
puts "Finished!"
