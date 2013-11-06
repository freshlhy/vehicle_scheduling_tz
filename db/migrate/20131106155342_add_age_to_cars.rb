class AddAgeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :age, :float
  end
end
