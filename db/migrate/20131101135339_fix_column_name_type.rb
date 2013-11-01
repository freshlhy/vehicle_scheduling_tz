class FixColumnNameType < ActiveRecord::Migration
	def change
    rename_column :plms, :type, :plm_type
  end
end
