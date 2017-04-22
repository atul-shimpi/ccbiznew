class CreateShopImages < ActiveRecord::Migration
  def change
    create_table :shop_images do |t|
    	t.string :image
    	t.references   :shop
      t.timestamps null: false
    end
  end
end
