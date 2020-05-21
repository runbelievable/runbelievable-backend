require 'rails_helper'

RSpec.describe UserRun, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :run }
  end
end
