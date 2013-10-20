class AddNoteIdToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :note_id, :integer
  end
end
