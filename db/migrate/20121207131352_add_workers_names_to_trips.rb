class AddWorkersNamesToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :workers_names, :string
  end
end
