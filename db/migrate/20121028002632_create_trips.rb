class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :car_driver_id
      t.date :departure_time
      t.date :back_time
      t.string :note

      t.timestamps
    end
  end
end
