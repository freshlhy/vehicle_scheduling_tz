class RemoveCarIdFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :car_id
  end

  def down
    add_column :trips, :car_id, :integer
  end
end
