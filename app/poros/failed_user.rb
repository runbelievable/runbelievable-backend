class FailedUser
  attr_reader :id, :unauthorized
  
  def initialize(user_errors)
    @id = nil
    @unauthorized = user_errors.errors.messages.flatten.to_s
  end
end
