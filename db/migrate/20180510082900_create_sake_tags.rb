class CreateSakeTags < ActiveRecord::Migration[5.1]
  def change
    create_table :sake_tags do |t|
      t.references :sake_post, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
