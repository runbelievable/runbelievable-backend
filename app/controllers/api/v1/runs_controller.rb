class Api::V1::RunsController < ApplicationController
  
  def index
    render json: RunSerializer.new(Run.all)
  end

  def show
    run = Run.find(params[:id])
    render json: RunSerializer.new(run)
  end

  def create
    run = Run.new(run_params)
    if run.save
      render json: RunSerializer.new(run), status: 201
    else
      run_message = FailedRun.new(run)
      render json: FailedSerializer.new(run_message), status: 401
    end
  end

  private
  def run_params 
      params.permit(:distance, :location, :total_time, :average_pace)
  end
end
