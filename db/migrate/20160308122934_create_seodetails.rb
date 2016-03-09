class CreateSeodetails < ActiveRecord::Migration
  def change
    create_table :seodetails do |t|
      t.text :title
      t.text :metakeywords
      t.text :metadescription
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
