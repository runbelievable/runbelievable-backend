class User < ApplicationRecord
  validates_presence_of :first_name,
                       :last_name,
                       :age,
                       :gender,
                       :max_run_distance,
                       :estimated_mile_pace

end
