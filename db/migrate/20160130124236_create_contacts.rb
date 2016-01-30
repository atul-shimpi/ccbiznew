class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contactname
      t.string :contactemail
      t.string :contactnumber
      t.text :contactinfo
      t.decimal :shoprating

      t.timestamps null: false
    end
  end
end
