class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string   :name
	  t.text   :description
	  t.string   :start_date
	  t.string   :end_date
	  t.string  :status
	  t.string  :brand
	  t.string  :product
	  t.string  :discount
	  t.references   :shop
      t.timestamps null: false
    end
  end
end
