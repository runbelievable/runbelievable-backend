class Hike
  attr_reader :id, :name, :summary, :difficulty, :location, :url, :length, :conditionStatus

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @summary = data["summary"]
    @difficulty = data["difficulty"]
    @location = data["location"]
    @url = data["url"]
    @length = data["length"]
    @conditionStatus = data["conditionStatus"]
  end
end
