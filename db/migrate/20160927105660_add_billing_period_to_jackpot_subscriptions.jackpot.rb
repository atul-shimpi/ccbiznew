# This migration comes from jackpot (originally 20120208191815)
class AddBillingPeriodToJackpotSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :billing_period, :integer
  end
end
