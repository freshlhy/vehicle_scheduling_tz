class CreateAccidents < ActiveRecord::Migration
  def change
    create_table :accidents do |t|
      t.integer :driver_id
      t.integer :car_id
      t.string :location
      t.date :a_date
      t.string :responsible
      t.string :damage
      t.integer :casualties

      t.timestamps
    end
  end
end
