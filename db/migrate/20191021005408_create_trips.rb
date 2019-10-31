class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.jsonb :origin
      t.jsonb :destination

      t.timestamps
    end
  end
end
