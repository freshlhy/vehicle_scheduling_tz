class CreateDriverStats < ActiveRecord::Migration
  def change
    create_table :driver_stats do |t|
      t.integer :driver_id
      t.float :driver_age
      t.integer :trip_count
      t.integer :accident_count

      t.timestamps
    end
  end
end
