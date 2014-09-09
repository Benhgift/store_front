class FixCommentsIndex < ActiveRecord::Migration
  def change
    rename_column :comments, :article_id, :category_id
  end
end
