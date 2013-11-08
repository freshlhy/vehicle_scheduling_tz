class AddAgeToCars < ActiveRecord::Migration
  def change
    add_column :cars, :age, :float, default:0.0
  end
end
