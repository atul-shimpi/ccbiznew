class AddIsSuperAdminToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :issuperadmin, :integer
  end
end
