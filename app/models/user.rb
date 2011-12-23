class User < ActiveRecord::Base
  validates :login,
    length: {
      in: 2..10,
      message: {
        code: :INVALID_LENGTH,
        max: 10,
        min: 2,
        description: "Invalid length"
    }
  }
end
