# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Run.destroy_all


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

user1 = User.create(username: 'agallant',
      first_name: 'Alex',
      last_name: 'Baker',
      password: 'password',
      location: 'Denver',
      age: '31',
      gender: 'Male',
      max_run_distance: 10,
      estimated_mile_pace: '08:00')

user2 = User.create(username: 'buffaloman',
      first_name: 'Bob',
      last_name: 'Stinson',
      password: 'password',
      location: 'Denver',
      age: '30',
      gender: 'Male',
      max_run_distance: 5,
      estimated_mile_pace: '10:00')

user3 = User.create(username: 'baluga',
      first_name: 'Michelle',
      last_name: 'Seinfeld',
      password: 'password',
      location: 'Denver',
      age: '32',
      gender: 'Female',
      max_run_distance: 10,
      estimated_mile_pace: '09:00')

      #user1 runs
user1.runs.create(distance: 10,
    location: 'Denver',
    total_time: '50:00',
    average_pace: '10:00')
user1.runs.create(distance: 5,
    location: 'Denver',
    total_time: '40:00',
    average_pace: '10:00')
user1.runs.create(distance: 3,
    location: 'Denver',
    total_time: '20:00',
    average_pace: '10:00')

    #user2 runs
user2.runs.create(distance: 10,
    location: 'Denver',
    total_time: '50:00',
    average_pace: '10:00')
user2.runs.create(distance: 5,
    location: 'Denver',
    total_time: '40:00',
    average_pace: '10:00')
user2.runs.create(distance: 3,
    location: 'Denver',
    total_time: '20:00',
    average_pace: '10:00')

    #user3 runs
user3.runs.create(distance: 10,
    location: 'Denver',
    total_time: '50:00',
    average_pace: '10:00')
user3.runs.create(distance: 5,
    location: 'Denver',
    total_time: '40:00',
    average_pace: '10:00')
user3.runs.create(distance: 3,
    location: 'Denver',
    total_time: '20:00',
    average_pace: '10:00')

# #Messages
# msg1 = user1.send_message(user2, {topic:"RE: Fun day", body: "Hey lisa, Im exicited for a fun day of hiking and running!"})
# msg2 = msg1.reply({topic:"RE: Fun day", body: "Hey Billy, Im exicited too!! cant wait for the mtns!"})
# msg3 = msg2.reply({topic:"RE: Fun day", body: "Cool Lisa! -billy"})
#
# msg4 = user2.send_message(user1, {topic:"I have dog for sale", body: "I know you like dogs, want to buy one? "})
