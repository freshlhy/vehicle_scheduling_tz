class AddTripIdToTripUsers < ActiveRecord::Migration
  def change
    add_column :trip_users, :trip_id, :integer
  end
end
