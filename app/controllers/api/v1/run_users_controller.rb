class Api::V1::RunUsersController < ApplicationController
  def index
    render json: UserSerializer.new(Run.find(params[:run_id]).users)
  end

  def show
    render json: UserSerializer.new(Run.find(params[:run_id]).users.find(params[:user_id]))
  end

  def destroy
    render json: UserSerializer.new(Run.find(params[:run_id]).users.destroy(params[:user_id]))
  end

  def update
    render json: UserSerializer.new(User.update(params[:user_id], user_params))
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(User.create(user_params)), status: 201
    else
      user_message = FailedUser.new(user)
      render json: FailedSerializer.new(user_message), status: 401
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :age, :gender, :estimated_mile_pace, :max_run_distance)
  end
end
