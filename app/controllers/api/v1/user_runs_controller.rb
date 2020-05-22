class Api::V1::UserRunsController < ApplicationController
  def index
    render json: RunSerializer.new(User.find(params[:user_id]).runs)
  end
end
