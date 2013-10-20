class AddCurrentTripToCar < ActiveRecord::Migration
  def change
    add_column :cars, :current_trip, :integer, default:0
  end
end
