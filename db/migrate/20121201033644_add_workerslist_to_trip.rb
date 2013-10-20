class AddWorkerslistToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :workerslist, :string
  end
end
