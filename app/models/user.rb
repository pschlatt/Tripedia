class User < ApplicationRecord
  has_many :trips

  validates_presence_of :email
  validates_presence_of :password

end
