class AddMileageStatusValueToSupervises < ActiveRecord::Migration
  def change
    add_column :supervises, :mileage_status_value, :float, default:0.0
  end
end
