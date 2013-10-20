class AddDrivershipIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :drivership_id, :integer
  end
end
