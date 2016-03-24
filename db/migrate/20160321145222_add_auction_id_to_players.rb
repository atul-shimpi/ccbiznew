class AddAuctionIdToPlayers < ActiveRecord::Migration
  def change
    add_reference :players, :auction, index: true, foreign_key: true
  end
end
