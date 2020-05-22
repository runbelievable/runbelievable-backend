class FailedRun
  attr_reader :id, :unauthorized
  def initialize(run_errors)
    @id = nil
    @unauthorized = run_errors.errors.messages.flatten.to_s
  end
end
