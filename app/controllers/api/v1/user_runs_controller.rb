class Api::V1::UserRunsController < ApplicationController
  def index
    render json: RunSerializer.new(User.find(params[:user_id]).runs)
  end

  def show
    render json: RunSerializer.new(User.find(params[:user_id]).runs.find(params[:run_id]))
  end

  def destroy
    render json: RunSerializer.new(User.find(params[:user_id]).runs.destroy(params[:run_id]))
  end

  def update
    render json: RunSerializer.new(Run.update(params[:run_id], run_params))
  end

  def create
    run = Run.new(run_params)
    if run.save
      render json: RunSerializer.new(Run.create(run_params)), status: 201
    else
      run_message = FailedRun.new(run)
      render json: FailedSerializer.new(run_message), status: 401
    end
  end

  private

  def run_params
    params.permit(:distance, :total_time, :location, :average_pace)
  end
end
