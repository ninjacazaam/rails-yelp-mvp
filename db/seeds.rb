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
  3.times do
    review = Review.new(
      content: Faker::Lorem.paragraph,
      rating: rand(5)
    )
   puts "Wrote a review"
   review.restaurant = restaurant
   review.save
  end
end

puts "Finished!"
