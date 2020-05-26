FactoryBot.define do
  factory :user do
    username { Faker::Creature::Dog.name }
    first_name { Faker::Creature::Cat.name }
    last_name { Faker::Creature::Dog.name }
    password { Faker::Creature::Dog.name }
    age { rand(1..100).to_s }
    gender { ['Male', 'Female'].shuffle.pop }
    max_run_distance { rand(1..50) }
    estimated_mile_pace { ['10:00', '08:00', '09:00', '07:00', '06:00', '05:00'].shuffle.pop }

    # role { :default }
  end
end
