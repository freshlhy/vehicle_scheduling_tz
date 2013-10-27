class AddSinceToCars < ActiveRecord::Migration
  def change
    add_column :cars, :since, :date
  end
end
