class AddIsreceiptToSiteUserFields < ActiveRecord::Migration
  def change
    add_column :site_user_fields, :isreceipt, :boolean
  end
end
