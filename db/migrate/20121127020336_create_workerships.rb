class CreateWorkerships < ActiveRecord::Migration
  def change
    create_table :workerships do |t|
      t.belongs_to :trip
      t.belongs_to :worker

      t.timestamps
    end
    add_index :workerships, :trip_id
    add_index :workerships, :worker_id
  end
end
