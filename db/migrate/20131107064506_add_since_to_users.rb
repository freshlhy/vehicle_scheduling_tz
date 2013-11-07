class AddSinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :since, :date
  end
end
