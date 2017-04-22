class AddColumnsToShop < ActiveRecord::Migration
  def change
    add_column :shops, :metakeywords, :text
    add_column :shops, :metadescription, :text
    add_column :shops, :googleanalytics, :text
    add_column :shops, :isactive, :integer
  end
end
