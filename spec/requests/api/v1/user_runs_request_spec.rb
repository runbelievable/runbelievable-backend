require 'rails_helper'

describe 'users runs API' do
  before :each do
    User.destroy_all
    Run.destroy_all
  end

  it "can find a user's runs" do
    user = create(:user)
    run1 = create(:run)
    run2 = create(:run)
    user.runs << [run1, run2]

    get "/api/v1/users/#{user.id}/runs"

    runs = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(runs.count).to eq(2)
    expect(runs[0][:attributes].count).to eq(4)
  end

  it "can find a specifc run by a user's id" do
    user = create(:user)
    run1 = create(:run)
    run2 = create(:run)
    user.runs << [run1, run2]

    get "/api/v1/users/#{user.id}/runs/#{run1.id}"

    run = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(run[:id].to_i).to eq(run1.id)
    expect(run[:attributes][:distance]).to eq(run1.distance)
    expect(run[:attributes][:total_time]).to eq(run1.total_time)
    expect(run[:attributes][:location]).to eq(run1.location)
    expect(run[:attributes][:average_pace]).to eq(run1.average_pace)
  end

  it "can delete a user's run by it's id" do
    user = create(:user)
    run1 = create(:run)
    run2 = create(:run)
    run3 = create(:run)

    user.runs << [run1, run2, run3]

    expect(user.runs.count).to eq(3)

    delete "/api/v1/users/#{user.id}/runs/#{run1.id}"

    expect(response).to be_successful
    expect(user.runs.count).to eq(2)
    expect(user.runs.ids).to_not include(run1.id)
  end

  it "can update a user's run information" do
    user = create(:user)
    run1 = create(:run)
    user.runs << [run1]
    id = user.id

    previous_run_distance = user.runs.first.distance
    run_params = { distance: 5 }

    put "/api/v1/users/#{id}/runs/#{run1.id}", params: run_params
    run = Run.find_by(id: run1.id)

    expect(response).to be_successful
    expect(run.distance).to eq(5)
    expect(run.distance).to_not eq(previous_run_distance)
  end

  it "user can create a run" do
    user = create(:user)
    run_params = { distance: 5.25,
                   total_time: "35:35",
                   location: 'Denver',
                   average_pace: '08:00'}

    post "/api/v1/users/#{user.id}/runs", params: run_params

    expect(response).to be_successful
    run = Run.last

    expect(run.distance).to eq(run_params[:distance])
    expect(run.total_time).to eq(run_params[:total_time])
    expect(run.location).to eq(run_params[:location])
    expect(run.average_pace).to eq(run_params[:average_pace])
  end

  it "user cannot create a new run without necessary attributes" do
    user = create(:user)
    run_params = { distance: 5.25,
                   total_time: "35:35",
                   location: 'Denver'}

    post "/api/v1/users/#{user.id}/runs", params: run_params

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(json[:attributes].values.join).to eq("[:average_pace, [\"can't be blank\"]]")
  end
end
