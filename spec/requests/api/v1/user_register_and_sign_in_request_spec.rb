require 'rails_helper'

RSpec.describe 'User registration endpoint' do
  it 'It can take in registration from user ' do

    post '/api/v1/users', params: { first_name: "john",
                                    last_name: "brown",
                                    age: "99",
                                    username: "fun",
                                    password: "fun2",
                                    gender: "man",
                                    max_run_distance: 5,
                                    estimated_mile_pace: "08:00"}


    expect(response).to be_successful
    user = User.last
    expect(user.username).to eq('fun')
  end

  it 'Bad registration attempts not sucessfull and render faileduser serializer' do

    post '/api/v1/users', params: { first_name: "john",
                                    last_name: "brown",
                                    age: "99",
                                    username: "fun",
                                    password: "fun2",
                                    gender: "man",
                                    estimated_mile_pace: "08:00"}

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:attributes].values.join).to eq("[:max_run_distance, [\"can't be blank\"]]")
  end

  it 'existing user can login' do

    user = create(:user, username: "timmy", password: "tim")
    
    post '/api/v1/login', params: {username: user.username, password: user.password}

    expect(response).to be_successful
    user_resp = User.last
    expect(session[:current_user_id]).to eq(user_resp.id)
    expect(user_resp.username).to eq('timmy')
  end

  it 'existing user cant login with bad credentials' do

    user = create(:user, username: "timmy", password: "tim")
    
    post '/api/v1/login', params: {username: user.username, password: "hi"}

    expect(response).to_not be_successful
    user_resp = User.last
    expect(session[:current_user_id]).to eq(nil)
  end

  it 'existing user with session can log out ' do

    user = create(:user, username: "timmy", password: "tim")
    
    post '/api/v1/login', params: {username: user.username, password: user.password}

    expect(response).to be_successful
    user_resp = User.last
    expect(session[:current_user_id]).to eq(user_resp.id)
    expect(user_resp.username).to eq('timmy')

    get "/api/v1/logout"

    expect(response).to be_successful
    expect(response.body).to eq("{\"logout_message\":\"You have been logged out\"}")
    expect(session[:current_user_id]).to eq(nil)
  end
end