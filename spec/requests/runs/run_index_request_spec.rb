require 'rails_helper'

describe "Runs API" do
  before :each do
    Run.destroy_all
  end

  it "can send all runs to index" do
    create_list(:run, 3)

    get '/api/v1/runs'

    expect(response).to be_successful

    runs = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(runs.count).to eq(3)
    expect(runs.first[:attributes].count).to eq(4)
  end

  it "returns empty when there are no runs" do

    get '/api/v1/runs'

    expect(response).to be_successful

    runs = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(runs.count).to eq(0)
    expect(runs).to eq([])
  end
end
