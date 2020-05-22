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
    expect(users.first[:attributes].count).to eq(6)
  end

  it "returns empty when there are no users" do

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(users.count).to eq(0)
    expect(users).to eq([])
  end


end
