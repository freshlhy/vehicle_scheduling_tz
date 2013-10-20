class AddIngToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :ing, :boolean, default: false
  end
end
