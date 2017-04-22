class AddHomeContentToShops < ActiveRecord::Migration
  def change
    add_column :shops, :homecontent, :text
  end
end
