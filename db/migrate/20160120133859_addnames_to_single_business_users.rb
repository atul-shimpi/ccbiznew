class AddnamesToSingleBusinessUsers < ActiveRecord::Migration
  def change
  	add_column :single_business_users, :middle_name, :string
  	add_column :single_business_users, :last_name, :string
  end
end
