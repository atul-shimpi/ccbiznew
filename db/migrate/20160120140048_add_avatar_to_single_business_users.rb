class AddAvatarToSingleBusinessUsers < ActiveRecord::Migration
  def change
    add_column :single_business_users, :avatar, :string
  end
end
