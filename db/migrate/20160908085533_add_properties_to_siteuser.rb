class AddPropertiesToSiteuser < ActiveRecord::Migration
  def change
    add_column :site_users, :properties, :text
  end
end
