# This migration comes from jackpot (originally 20111230014003)
class AddCustomerInformationToJackpotPayments < ActiveRecord::Migration
  def change
    add_column :payments, :customer_name, :string
  end
end
