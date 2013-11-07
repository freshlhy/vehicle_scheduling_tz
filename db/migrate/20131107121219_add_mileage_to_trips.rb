class AddMileageToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :mileage, :integer
  end
end
