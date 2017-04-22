class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
