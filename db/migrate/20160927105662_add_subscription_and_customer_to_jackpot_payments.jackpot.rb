# This migration comes from jackpot (originally 20120209203542)
class AddSubscriptionAndCustomerToJackpotPayments < ActiveRecord::Migration
  def change
    change_table :payments do |t|
      t.references :subscription 
      t.references :customer 
    end 
  end
end
