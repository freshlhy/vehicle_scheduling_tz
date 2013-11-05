class CreateSupervises < ActiveRecord::Migration
  def change
    create_table :supervises do |t|
      t.integer :part_id
      t.integer :car_id
      t.date :start
      t.integer :current_mileage
      t.integer :current_life
      t.string :mileage_status
      t.string :life_status
      t.string :is_active

      t.timestamps
    end
  end
end
