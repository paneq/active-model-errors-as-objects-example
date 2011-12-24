require 'invalid_length_error'

class User < ActiveRecord::Base

  validate :login_length

  private

  def login_length
    return if login.size >= 2 && login.size <= 10
    errors.add(:login, InvalidLengthError.new(2, 10, login.size))
  end

end
