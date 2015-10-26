module Admin::OffersHelper
	def adminshop_offers_action(offer, action)
		if action == "new"
			admin_offers_path(offer)
		else
			admin_offer_path(offer)
		end

	end
end
