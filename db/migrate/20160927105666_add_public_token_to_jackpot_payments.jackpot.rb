# This migration comes from jackpot (originally 20120402183515)
class AddPublicTokenToJackpotPayments < ActiveRecord::Migration
  def change
    add_column :payments, :public_token, :string
    add_index  :payments, :public_token
  end
end
