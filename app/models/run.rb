class Run < ApplicationRecord
  validates_presence_of :distance,
                        :location,
                        :total_time,
                        :average_pace

  has_many :user_runs
  has_many :users, through: :user_runs
end
