class CreatePlms < ActiveRecord::Migration
  def change
    create_table :plms do |t|
      t.integer :car_id
      t.string :type
      t.string :value
      t.date :begin
      t.date :last
      t.date :next
      t.boolean :is_active, :default => false

      t.timestamps
    end
  end
end
