class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :photo
      t.string :discription
      t.datetime :date

      t.timestamps null: false
    end
  end
end
