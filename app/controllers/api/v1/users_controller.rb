class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
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

  def register
    user = User.create(user_params)
    if user.save
      session[:current_user_id] = user.id
      render json: UserSerializer.new(User.create(user_params)), status: 201
    else
      user_message = FailedUser.new(user)
      render json: FailedSerializer.new(user_message), status: 401
    end
  end

  def update
    render json: UserSerializer.new(User.update(params[:id], user_params))
  end

  def destroy
    render json: UserSerializer.new(User.destroy(params[:id]))
  end

  def match_users
    if current_user
      users = current_user.match
    end
    render json: UserSerializer.new(users)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :age, :gender, :estimated_mile_pace, :max_run_distance, :location)
  end
end
