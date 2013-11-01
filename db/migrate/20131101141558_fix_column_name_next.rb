class FixColumnNameNext < ActiveRecord::Migration
	def change
    rename_column :plms, :next, :nextd
  end
end
