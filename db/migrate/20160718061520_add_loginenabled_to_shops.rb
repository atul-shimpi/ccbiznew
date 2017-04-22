class AddLoginenabledToShops < ActiveRecord::Migration
  def change
    add_column :shops, :loginenabled, :boolean
  end
end
