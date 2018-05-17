class RemoveTagListFromSakePost < ActiveRecord::Migration[5.1]
  def change
    remove_column :sake_posts, :tag_list, :text
  end
end
