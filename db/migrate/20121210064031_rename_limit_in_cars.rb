class RenameLimitInCars < ActiveRecord::Migration
  def up
    rename_column :cars, :limit, :load
  end

  def down
  end
end
