class AddStoreuseridToBusinessUser < ActiveRecord::Migration
  def change
    add_column :business_users, :storeuserid, :integer
  end
end
