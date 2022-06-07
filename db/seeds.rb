require 'faker'

puts 'Clearing the database'
Restaurant.destroy_all
puts 'Database is empty'
puts 'Creating restaurants...'
5.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  puts "Created #{restaurant.name}"
end

puts "Finished!"
