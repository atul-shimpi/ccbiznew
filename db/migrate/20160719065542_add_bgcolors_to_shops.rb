class AddBgcolorsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :headerbg, :text
    add_column :shops, :footerbg, :text
  end
end
