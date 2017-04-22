class AddLayoutToShops < ActiveRecord::Migration
  def change
    add_column :shops, :headerhtml, :text
    add_column :shops, :footerhtml, :text
  end
end
