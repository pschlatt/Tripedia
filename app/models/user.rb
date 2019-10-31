class User < ApplicationRecord
  has_many :trips

  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :name

  def send_instructions
    Notifier.instructions(self).deliver_now
  end

end
