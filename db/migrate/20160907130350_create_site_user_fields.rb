class CreateSiteUserFields < ActiveRecord::Migration
  def change
    create_table :site_user_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
