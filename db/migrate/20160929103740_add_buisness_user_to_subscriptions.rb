class AddBuisnessUserToSubscriptions < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :business_user, index: true, foreign_key: true
  end
end
