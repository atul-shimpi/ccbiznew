class AddBackgroundimageToShop < ActiveRecord::Migration
  def change
    add_column :shops, :backgroundimage, :string
  end
end
