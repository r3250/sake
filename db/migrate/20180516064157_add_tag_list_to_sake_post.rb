class AddTagListToSakePost < ActiveRecord::Migration[5.1]
  def change
    add_column :sake_posts, :tag_list, :text
  end
end
