class Api::V1::HikingController < ApplicationController
    def show
        # binding.pry
        service = HikeMicroService.new(current_user.location)
        hike = Hike.new(service.get_single_hiking_trail)
        render json: HikeSerializer.new(hike)        
    end
end 