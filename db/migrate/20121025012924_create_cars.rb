class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :plate

      t.timestamps
    end
  end
end
