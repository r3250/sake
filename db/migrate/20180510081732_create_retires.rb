class CreateRetires < ActiveRecord::Migration[5.1]
  def change
    create_table :retires do |t|
      t.text :retire_reason
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
