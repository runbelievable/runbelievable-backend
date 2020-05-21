require 'rails_helper'

RSpec.describe Run, type: :model do
  describe 'validations' do
    it { should validate_presence_of :distance }
    it { should validate_presence_of :location }
    it { should validate_presence_of :total_time }
    it { should validate_presence_of :average_pace }
  end

  describe 'relationships' do
    it { should have_many :user_runs}
    it { should have_many(:users).through(:user_runs)}
  end
end
