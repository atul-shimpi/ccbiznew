module BusinessUser::AuctionsHelper
	def business_shop_auctions_action(offer, action)
		if action == "new"
			business_user_auctions_path(offer)
		else
			business_user_auction_path(offer)
		end

	end
end
