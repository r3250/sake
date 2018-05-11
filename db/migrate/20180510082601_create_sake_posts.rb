class CreateSakePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :sake_posts do |t|
      t.string :sake_name, null: false, default: "いいちこ"
      t.string :shop_name
      t.text :caption,     null: false, default: "どこでも買えるお酒"
      t.string :address
      t.float :longitude
      t.float :latitude
      t.text :image_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
