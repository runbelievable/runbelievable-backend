require 'rails_helper'

describe 'Runs API destoy functionallity' do
  before :each do
    Run.destroy_all
  end

  it 'can destroy a run' do
    run = create(:run)
    expect(Run.count).to eq(1)
    delete "/api/v1/runs/#{run.id}"
    expect(response).to be_successful
    expect(Run.count).to eq(0)
    expect { Run.find(run.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
