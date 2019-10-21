class Trip < ApplicationRecord
  validates_presence_of :origin
  validates_presence_of :destination
end
