class ChangeTypeInPlm < ActiveRecord::Migration
	def change
    change_column :plms, :is_active, :string
  end
end
