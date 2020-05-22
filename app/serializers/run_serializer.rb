class RunSerializer
  include FastJsonapi::ObjectSerializer
  attributes :distance, :total_time, :location, :average_pace
end
 