class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string, default:"男"
  end
end
