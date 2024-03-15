# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# seeds.rb

require 'faker'
require 'uri'
require 'net/http'
require 'json'


response = Net::HTTP.get_response(URI('https://dog.ceo/api/breeds/list/all'))
breeds_data = JSON.parse(response.body)['message']
 

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

# Create breeds and sub-breeds
breeds_data.each do |breed_name, sub_breeds|
  user_id = User.pluck(:id).sample 

  # Create the breed record
  breed = Breed.create(
    name: breed_name.to_s.capitalize,
    user_id: user_id
  )

  # Create sub-breeds if any
  sub_breeds.each do |sub_breed_name|
    SubBreed.create(
      name: sub_breed_name.capitalize, 
      breed_id: breed.id
    )
  end
end

