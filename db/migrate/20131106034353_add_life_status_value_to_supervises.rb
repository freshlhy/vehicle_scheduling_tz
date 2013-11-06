class AddLifeStatusValueToSupervises < ActiveRecord::Migration
  def change
    add_column :supervises, :life_status_value, :float
  end
end
