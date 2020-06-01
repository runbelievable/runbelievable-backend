require 'rails_helper'

describe 'users runs API' do
  before :each do
    User.destroy_all
    Run.destroy_all
    @user1 = create(:user, username: "timmy", password: "tim", location: "denver, co" )

    post '/api/v1/login', params: { first_name: @user1.first_name,
                                        last_name: @user1.last_name,
                                        age: @user1.age,
                                        username: @user1.username,
                                        password: @user1.password,
                                        location: @user1.location,
                                        gender: @user1.location,
                                        max_run_distance: @user1.max_run_distance,
                                        estimated_mile_pace: @user1.estimated_mile_pace}
  end
 
  it "can return a single hike element when a user asks" do 
    get "/api/v1/users/#{@user1.id}/random_trail"
    
    expect(response).to be_successful
    trail = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(trail[:id]).to be_a Integer
    expect(trail[:name]).to be_a String
    expect(trail[:location]).to be_a String
    expect(trail[:summary]).to be_a String
    expect(trail[:length]).to be_a Float
    expect(trail[:difficulty]).to be_a String
    expect(trail[:conditionStatus]).to be_a String
    expect(trail[:url]).to_not be(nil)
  end 
end
