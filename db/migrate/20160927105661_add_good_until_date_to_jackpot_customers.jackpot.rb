# This migration comes from jackpot (originally 20120208191934)
class AddGoodUntilDateToJackpotCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :good_until, :date

  end
end
