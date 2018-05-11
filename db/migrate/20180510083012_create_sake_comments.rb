class CreateSakeComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sake_comments do |t|
      t.references :user, foreign_key: true
      t.references :sake_post, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
