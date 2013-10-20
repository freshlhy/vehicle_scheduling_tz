class AddCarIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :car_id, :integer
  end
end
