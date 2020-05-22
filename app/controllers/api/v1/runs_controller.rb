class Api::V1::RunsController < ApplicationController
  def index
    render json: RunSerializer.new(Run.all)
  end
end
