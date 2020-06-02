FactoryBot.define do
  factory :run do
    distance { rand(1.00..50.00).round(2) }
    location { Faker::Address.city }
    total_time { ['10:00', '20:00', '30:00', '40:00', '50:00', '15:00'].shuffle.pop }
    average_pace { ['10:00', '08:00', '09:00', '07:00', '06:00', '05:00'].shuffle.pop }
  end
end
