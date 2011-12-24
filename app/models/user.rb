require 'better_length_validator'

class User < ActiveRecord::Base

  better_validates_length_of :login, :in => 2..10

end
