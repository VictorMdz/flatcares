class UserContext
  attr_reader :user, :session

  def initialize(user, session)
    @user = user
    @session = session
  end
end
