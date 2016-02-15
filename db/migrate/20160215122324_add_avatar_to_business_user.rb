class AddAvatarToBusinessUser < ActiveRecord::Migration
  def change
    add_column :business_users, :avatar, :string
  end
end
