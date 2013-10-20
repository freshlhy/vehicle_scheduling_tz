class RenameLoad < ActiveRecord::Migration
  def up
    rename_column :cars, :load, :load_limit
  end

  def down
  end
end
