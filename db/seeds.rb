# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
      username: Faker::Creature::Dog.name,
      first_name: Faker::Creature::Cat.name,
      last_name: Faker::Creature::Dog.name,
      password: Faker::Creature::Dog.name,
      location: Faker::Address.city,
      age: rand(1..100).to_s,
      gender: ['Male', 'Female'].shuffle.pop,
      max_run_distance: rand(1..50),
      estimated_mile_pace: ['10:00', '08:00', '09:00', '07:00', '06:00', '05:00'].shuffle.pop)
end

5.times do
  User.create(
      username: Faker::Creature::Dog.name,
      first_name: Faker::Creature::Cat.name,
      last_name: Faker::Creature::Dog.name,
      password: Faker::Creature::Dog.name,
      location: 'Denver',
      age: rand(1..100).to_s,
      gender: ['Male', 'Female'].shuffle.pop,
      max_run_distance: rand(1..50),
      estimated_mile_pace: '10:00')
end
