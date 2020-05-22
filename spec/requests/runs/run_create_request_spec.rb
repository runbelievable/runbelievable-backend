require 'rails_helper'

describe "Runs API create functionality" do
  before :each do
    Run.destroy_all
  end

  it "can post valid params and create a user" do
    create_list(:run, 3)
    run = create(:run, average_pace: "08:00")

    post "/api/v1/runs/", params: {
                        distance: run.distance,
                        location: run.location,
                        total_time: run.total_time,
                        average_pace: run.average_pace
    }

    expect(response).to be_successful

    run_json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(run_json[:attributes].count).to eq(4)
    expect(run_json[:attributes][:average_pace]).to eq("08:00")
    expect(path).to eq( "/api/v1/runs")
  end 
end 