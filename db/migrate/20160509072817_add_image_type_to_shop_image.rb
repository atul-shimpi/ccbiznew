class AddImageTypeToShopImage < ActiveRecord::Migration
  def change
    add_column :shop_images, :imagetype, :integer
  end
end
