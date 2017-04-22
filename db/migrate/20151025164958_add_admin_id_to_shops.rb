class AddAdminIdToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :admin_id, :integer
  end
end
