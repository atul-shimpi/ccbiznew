class AddShopTypeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :shoptype, :integer
  end
end
