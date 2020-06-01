class HikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :summary, :difficulty, :location, :url, :length, :conditionStatus
end
