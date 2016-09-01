class UpdateIndexOnSiteuser < ActiveRecord::Migration
  def down
	change_table :site_users do |t|
      t.remove_index :email
   end
  end
end
