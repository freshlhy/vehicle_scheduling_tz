class CreateDriverStats < ActiveRecord::Migration
  def change
    create_table :driver_stats do |t|
      t.integer :driver_id
      t.float :driver_age
      t.integer :trip_count, default:0
      t.integer :accident_count, default:0

      t.timestamps
    end
  end
end
