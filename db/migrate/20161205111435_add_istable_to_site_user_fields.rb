class AddIstableToSiteUserFields < ActiveRecord::Migration
  def change
    add_column :site_user_fields, :isintable, :boolean
  end
end
