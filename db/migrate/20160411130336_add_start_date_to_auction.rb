class AddStartDateToAuction < ActiveRecord::Migration
  def change
    add_column :auctions, :startdatetime, :string
  end
end
