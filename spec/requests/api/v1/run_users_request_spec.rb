require 'rails_helper'

describe 'users runs API' do
  before :each do
    User.destroy_all
    Run.destroy_all
  end

  it "can find a run's users" do
    run = create(:run)
    user1 = create(:user)
    user2 = create(:user)

    run.users << [user1, user2]

    get "/api/v1/runs/#{run.id}/users"

    users = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(users.count).to eq(2)
    expect(users[0][:attributes].count).to eq(6)
  end

  it "can find a specifc user by a run's id" do
    run = create(:run)
    user1 = create(:user)
    user2 = create(:user)

    run.users << [user1, user2]

    get "/api/v1/runs/#{run.id}/users/#{user1.id}"

    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(user[:id].to_i).to eq(user1.id)
    expect(user[:attributes][:first_name]).to eq(user1.first_name)
    expect(user[:attributes][:last_name]).to eq(user1.last_name)
    expect(user[:attributes][:age]).to eq(user1.age)
    expect(user[:attributes][:gender]).to eq(user1.gender)
    expect(user[:attributes][:max_run_distance]).to eq(user1.max_run_distance)
    expect(user[:attributes][:estimated_mile_pace]).to eq(user1.estimated_mile_pace)
  end

  it "can delete a run's user by it's id" do
    run = create(:run)
    user1 = create(:user)
    user2 = create(:user)

    run.users << [user1, user2]

    expect(run.users.count).to eq(2)

    delete "/api/v1/runs/#{run.id}/users/#{user1.id}"

    expect(response).to be_successful
    expect(run.users.count).to eq(1)
    expect(run.users.ids).to_not include(user1.id)
  end

  it "can update a run's user information" do
    run = create(:run)
    user1 = create(:user)
    run.users << [user1]

    previous_user_name = run.users.first.first_name
    user_params = { first_name: 'Alex' }

    put "/api/v1/runs/#{run.id}/users/#{user1.id}", params: user_params
    user = User.find_by(id: user1.id)

    expect(response).to be_successful
    expect(user.first_name).to eq('Alex')
    expect(user.first_name).to_not eq(previous_user_name)
  end

  it "run can create a user" do
    run = create(:run)
    user_params = { first_name: 'Alex',
                   last_name: 'Gallant',
                   gender: "Male",
                   age: '31',
                   estimated_mile_pace: '08:00',
                   max_run_distance: 10}

    post "/api/v1/runs/#{run.id}/users", params: user_params

    expect(response).to be_successful
    user = User.last

    expect(user.first_name).to eq(user_params[:first_name])
    expect(user.last_name).to eq(user_params[:last_name])
    expect(user.age).to eq(user_params[:age])
    expect(user.gender).to eq(user_params[:gender])
    expect(user.max_run_distance).to eq(user_params[:max_run_distance])
    expect(user.estimated_mile_pace).to eq(user_params[:estimated_mile_pace])
  end

  it "run cannot create a new user without necessary attributes" do
    run = create(:run)
    user_params = { first_name: 'Alex',
                   last_name: 'Gallant',
                   gender: "Male",
                   age: '31',
                   estimated_mile_pace: '08:00'}

    post "/api/v1/runs/#{run.id}/users", params: user_params

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(json[:attributes].values.join).to eq("[:max_run_distance, [\"can't be blank\"]]")
  end
end
