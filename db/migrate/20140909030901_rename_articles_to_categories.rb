class RenameArticlesToCategories < ActiveRecord::Migration
  def change
    rename_table :articles, :categories
  end
end
