class AddDistanceToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :distance, :string
    add_column :trips, :duration, :string
  end
end
