class ChangeUserIdToBusinessUserId < ActiveRecord::Migration
  def change
  	rename_column :shops, :user_id, :business_user_id
  end
end
