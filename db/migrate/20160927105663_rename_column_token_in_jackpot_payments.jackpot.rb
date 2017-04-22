# This migration comes from jackpot (originally 20120209212043)
class RenameColumnTokenInJackpotPayments < ActiveRecord::Migration
  def change 
    rename_column :payments, :token, :payment_transaction_token
  end 
end
