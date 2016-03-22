class CreateTeamowners < ActiveRecord::Migration
  def change
    create_table :teamowners do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
