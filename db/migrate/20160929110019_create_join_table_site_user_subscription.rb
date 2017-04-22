class CreateJoinTableSiteUserSubscription < ActiveRecord::Migration
  def change
    create_join_table :site_users, :subscriptions do |t|
      # t.index [:site_user_id, :subscription_id]
      # t.index [:subscription_id, :site_user_id]
    end
  end
end
