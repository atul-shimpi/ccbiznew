class AddAvatarToShops < ActiveRecord::Migration
  def change
    add_column :shops, :avatar, :string
  end
end
