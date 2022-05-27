# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB"
User.destroy_all
Dog.destroy_all

#create users
20.times do
  user = User.create!(password: "123456",
                      first_name: Faker::Artist.name,
                      last_name: Faker::FunnyName.name,
                      address: Faker::Address.full_address,
                      email: Faker::Internet.email)
  puts "password:#{user.password} first_name:#{user.first_name}
        last_name:#{user.last_name} address:#{user.address} email:#{user.email}"
end

puts "Creating Dogs..."
250.times do
  dog = Dog.new(name: Faker::Creature::Dog.name,
                description: Faker::TvShows::SiliconValley.quote,
                breed: Dog::BREED.sample,
                size: Dog::SIZE.sample,
                age: rand(0..15),
                activity: Dog::ACTIVITY.sample,
                address: Dog::ADDRESS.sample)
  dog.user = User.all.sample
  dog.save
  puts "name:#{dog.name} description:#{dog.description} breed:#{dog.breed}
        size:#{dog.size} age:#{dog.age} activity:#{dog.activity} address:#{dog.address} "
end

puts "#{Dog.count} dogs created!"
