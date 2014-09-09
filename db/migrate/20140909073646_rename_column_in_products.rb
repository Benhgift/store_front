class RenameColumnInProducts < ActiveRecord::Migration
  def change
    rename_column :products, :commenter, :developer
  end
end
