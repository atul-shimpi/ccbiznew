class AddStoreidToShop < ActiveRecord::Migration
  def change
    add_column :shops, :storeid, :integer
  end
end
