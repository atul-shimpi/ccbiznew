 class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
 t.string     :alt,  default: ""
      t.string     :hint, default: ""
      t.string :file
      t.timestamps null: false
    end
  end
end
