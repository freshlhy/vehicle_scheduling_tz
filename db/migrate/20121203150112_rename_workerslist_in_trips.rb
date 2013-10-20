class RenameWorkerslistInTrips < ActiveRecord::Migration
  def change
    rename_column :trips, :workerslist, :worker_ids
  end
end
