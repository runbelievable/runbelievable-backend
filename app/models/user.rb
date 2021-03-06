class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :age
  validates_presence_of :gender
  validates_presence_of :max_run_distance
  validates_presence_of :estimated_mile_pace
  validates_presence_of :location

  has_secure_password
  acts_as_messageable :required => :body

  has_many :user_runs
  has_many :runs, through: :user_runs

  def match
    User.all
        .where(location: location)
        .order(:estimated_mile_pace)
  end
end
