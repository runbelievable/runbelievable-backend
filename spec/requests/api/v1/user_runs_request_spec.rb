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
end
