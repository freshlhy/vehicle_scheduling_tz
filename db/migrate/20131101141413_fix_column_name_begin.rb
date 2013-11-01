class FixColumnNameBegin < ActiveRecord::Migration
	def change
    rename_column :plms, :begin, :start
  end
end
