class Api::V1::HikingController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
        service = HikeMicroService.new(current_user.location)
        hike = Hike.new(service.get_single_hiking_trail)
        render json: HikeSerializer.new(hike)        
    end
end 