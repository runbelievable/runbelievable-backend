require 'rails_helper'

describe "Users API" do
  before :each do
    User.destroy_all
  end

  it "can send all users" do
    create_list(:user, 3)

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(users.count).to eq(3)
    expect(users.first[:attributes].count).to eq(7)
  end

  it "returns empty when there are no users" do

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(users.count).to eq(0)
    expect(users).to eq([])
  end

  it "shows a specific user by their id" do
    id = create(:user).id

    get "/api/v1/users/#{id}"

    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(user[:id].to_i).to eq(id)
  end

  it "can create a new user" do
    bob = create(:user)
    user1 = create(:user)

    user_params = { first_name: user1.first_name,
                    last_name: user1.last_name,
                    username: "fun",
                    password: "fun2",
                    age: user1.age,
                    gender: user1.gender,
                    max_run_distance: user1.max_run_distance,
                    estimated_mile_pace: user1.estimated_mile_pace}

    post "/api/v1/users", params: user_params
    user = User.last

    expect(response).to be_successful
    expect(user.first_name).to eq(user_params[:first_name])
    expect(user.first_name).to_not eq(bob.first_name)
  end

  it "cannot create a new user without all of the attributes" do
    user1 = create(:user)

    user_params = { first_name: user1.first_name,
                    last_name: user1.last_name,
                    age: user1.age,
                    username: "fun",
                    password: "fun2",
                    gender: user1.gender,
                    max_run_distance: user1.max_run_distance}
  

    post "/api/v1/users", params: user_params

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(json[:attributes].values.join).to eq("[:estimated_mile_pace, [\"can't be blank\"]]")
  end

  it "can update an existing user" do
    user1 = create(:user)
    previous_name = User.last.first_name
    user_params = { first_name: 'Alex',
                   last_name: user1.last_name,
                   username: user1.username,
                   password: user1.password,
                   gender: user1.gender,
                   age: user1.age,
                   estimated_mile_pace: user1.estimated_mile_pace,
                   max_run_distance: user1.max_run_distance}

    put "/api/v1/users/#{user1.id}", params: user_params
    user = User.find_by(id: user1.id)
    expect(response).to be_successful
    expect(user.first_name).to_not eq(previous_name)
    expect(user.first_name).to eq("Alex")
  end

  it "can destroy an user" do
    user = create(:user)

    expect(User.count).to eq(1)

    delete "/api/v1/users/#{user.id}"

    expect(response).to be_successful
    expect(User.count).to eq(0)
    expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
