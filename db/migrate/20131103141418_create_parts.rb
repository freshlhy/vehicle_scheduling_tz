class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :model
      t.integer :rating_mileage, default:0
      t.integer :rating_life, default:0

      t.timestamps
    end
  end
end
