class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
		t.string   :name
		t.string   :phone
		t.text   :address
		t.text   :info
		t.references   :user
      t.timestamps null: false
    end
  end
end
