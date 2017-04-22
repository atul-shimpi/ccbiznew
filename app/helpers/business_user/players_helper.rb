module BusinessUser::PlayersHelper
	
	def business_shop_players_action(player, action)
		if action == "new" || action == "create"
			business_user_players_path(player)
		else
			business_user_player_path(player)
		end

	end
	def auction_teams(auction_id, player_id)
		auction = Auction.find(auction_id)		
		player = Player.find(player_id)
		return auction.teams.where("points > "+player.baseprice.to_s)
	end
end
