class AddPageTitleToShops < ActiveRecord::Migration
  def change
    add_column :shops, :pagetitle, :string
  end
end
