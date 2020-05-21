class User < ApplicationRecord
  validates_presence_of :first_name,
                       :last_name,
                       :age,
                       :gender,
                       :max_run_distance,
                       :estimated_mile_pace

  has_many :user_runs
  has_many :runs, through: :user_runs
end
