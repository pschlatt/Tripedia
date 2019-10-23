class Trip < ApplicationRecord
  belongs_to :user

  validates_presence_of :origin
  validates_presence_of :destination
end
