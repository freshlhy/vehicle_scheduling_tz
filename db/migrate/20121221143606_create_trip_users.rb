class CreateTripUsers < ActiveRecord::Migration
  def change
    create_table :trip_users do |t|
      t.integer :user_id

      t.timestamps
    end

    add_index :trip_users, :user_id, unique: true
  end
end
