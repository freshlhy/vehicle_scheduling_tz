class AddLifeStatusValueToSupervises < ActiveRecord::Migration
  def change
    add_column :supervises, :life_status_value, :float, default:0.0
  end
end
