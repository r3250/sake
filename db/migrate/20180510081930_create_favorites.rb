class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :sake_post, foreign_key: true

      t.timestamps
    end
  end
end
