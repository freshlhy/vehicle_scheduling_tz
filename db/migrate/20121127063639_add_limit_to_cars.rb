class AddLimitToCars < ActiveRecord::Migration
  def change
    add_column :cars, :limit, :integer
  end
end
