class CreateUserfiles < ActiveRecord::Migration
  def change
    create_table :userfiles do |t|
      t.string :filename
      t.text :description
      t.references :site_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
