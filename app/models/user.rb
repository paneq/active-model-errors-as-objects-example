class User < ActiveRecord::Base

  validate :login_length

  private

  def login_length
    return if login.size >= 2 && login.size <= 10
    errors.add(:login, {
      code: :INVALID_LENGTH,
      max: 10,
      min: 2,
      current: login.size,
      description: "Invalid length"
    })
  end

end
