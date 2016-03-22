class CreateJoinTableAuctionSkill < ActiveRecord::Migration
  def change
    create_join_table :auctions, :skills do |t|
      # t.index [:auction_id, :skill_id]
      # t.index [:skill_id, :auction_id]
    end
  end
end
