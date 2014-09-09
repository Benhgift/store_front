class RenameCommentsToProducts < ActiveRecord::Migration
  def change
    rename_table :comments, :products
    add_column :products, :price, :decimal
  end
end
