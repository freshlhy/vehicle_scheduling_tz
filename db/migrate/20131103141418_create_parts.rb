class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :model
      t.integer :rating_mileage
      t.integer :rating_life

      t.timestamps
    end
  end
end
