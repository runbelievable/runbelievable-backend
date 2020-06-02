class HikeMicroService

  def initialize(location)
    @id = nil
    @location = location
  end

  def get_single_hiking_trail
   resp = conn.get ("recommend-hikes") do |f|
         f.params[:location] = @location
     end
     JSON.parse(resp.body)
  end

  private

  def conn
    Faraday.new(url: "https://run-be-microservice.herokuapp.com")
  end
end 
