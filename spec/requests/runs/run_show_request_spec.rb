require 'rails_helper'

describe "Runs API show functionality" do
  before :each do
    Run.destroy_all
  end

  it "can get info on a single run and visit page" do
    create_list(:run, 3)
    run = create(:run, average_pace: "08:00")

    get "/api/v1/runs/#{run.id}"

    expect(response).to be_successful

    run_json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(run_json[:attributes].count).to eq(4)
    expect(run_json[:attributes][:average_pace]).to eq("08:00")
  end 
end 

 