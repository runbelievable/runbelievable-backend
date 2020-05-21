require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :max_run_distance }
    it { should validate_presence_of :estimated_mile_pace }
  end

  describe 'relationships' do
    it { should have_many :user_runs}
    it { should have_many(:runs).through(:user_runs)}
  end
end
