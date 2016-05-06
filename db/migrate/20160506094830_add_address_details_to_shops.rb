class AddAddressDetailsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :addressname, :string
    add_column :shops, :buildingname, :text
    add_column :shops, :blockno, :text
  end
end
