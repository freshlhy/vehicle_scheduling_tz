class RemoveNoteFromTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :note
  end

  def down
    add_column :trips, :note, :string
  end
end
