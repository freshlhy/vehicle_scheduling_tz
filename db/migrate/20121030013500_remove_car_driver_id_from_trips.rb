class RemoveCarDriverIdFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :car_driver_id
  end

  def down
    add_column :trips, :car_driver_id, :integer
  end
end
