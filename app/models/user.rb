class User < ActiveRecord::Base
  validates :login, :length => { :in => 2..10 }
end
