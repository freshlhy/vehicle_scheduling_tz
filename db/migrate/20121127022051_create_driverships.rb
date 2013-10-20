class CreateDriverships < ActiveRecord::Migration
  def change
    create_table :driverships do |t|
      t.belongs_to :car
      t.belongs_to :driver

      t.timestamps
    end
    add_index :driverships, :car_id
    add_index :driverships, :driver_id
  end
end
