class AddSiteUserToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :site_user, index: true, foreign_key: true
  end
end
