class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def login
    user = User.find_by(username: params[:username])
    if !user.nil? && user.authenticate(params[:password])
      login_sucsess(user)
    else
      login_failed
    end
  end

  def logout
    session.delete(:current_user_id)
    render json: {logout_message: "You have been logged out"}, status: 201
  end

  private

  def login_sucsess(user)
    session[:current_user_id] = user.id
    render json: UserSerializer.new(user), status: 201
  end

  def login_failed
    render json: { failed: 'Please check username and password. Login Failed' }, status: 401
  end
end
