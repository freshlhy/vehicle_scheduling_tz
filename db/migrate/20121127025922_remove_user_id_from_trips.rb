class RemoveUserIdFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :user_id
  end

  def down
    add_column :trips, :user_id, :integer
  end
end
