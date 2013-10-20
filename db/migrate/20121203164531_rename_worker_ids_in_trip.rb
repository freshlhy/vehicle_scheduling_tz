class RenameWorkerIdsInTrip < ActiveRecord::Migration
  def change
    rename_column :trips, :worker_ids, :workers_ids
  end
end
