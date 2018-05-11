class AddLastNameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_name, :string, null: false, default: "田中"
    add_column :users, :first_name, :string, null: false, default: "太郎"
    add_column :users, :last_kana, :string, null: false, default: "タナカ"
    add_column :users, :first_kana, :string, null: false, default: "タロウ"
    add_column :users, :nickname, :string, null: false, default: "サンプル"
    add_column :users, :favorite_sake, :string
    add_column :users, :favorite_drink, :string
    add_column :users, :favorite_shop, :string
    add_column :users, :introduction, :text
    add_column :users, :deleted_at, :datetime
  end
end
