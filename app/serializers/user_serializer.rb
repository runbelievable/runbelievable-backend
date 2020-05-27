class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :username, :age, :gender, :max_run_distance, :estimated_mile_pace, :location
end
