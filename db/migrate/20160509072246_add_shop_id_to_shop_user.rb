class AddShopIdToShopUser < ActiveRecord::Migration
  def change
    add_reference :site_users, :shop, index: true, foreign_key: true
  end
end
