class CreateSingleBusinessUsers < ActiveRecord::Migration
  def change
    create_table :single_business_users do |t|
      t.string :name
      t.string :phone
      t.string :pannumber
      t.string :votingid
      t.string :adharid
      t.text :skills
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip

      t.timestamps null: false
    end
  end
end
