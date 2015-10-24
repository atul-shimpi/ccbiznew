module BusinessUser::OffersHelper
	def business_shop_offers_action(offer, action)
		if action == "new"
			business_user_offers_path(offer)
		else
			business_user_offer_path(offer)
		end

	end
end
