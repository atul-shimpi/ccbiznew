module ApplicationHelper
	def nav_path_for_shop
	if business_user_signed_in?
  	   business_user_shops_path
    elsif admin_signed_in?
      admin_shops_path
    end
	end
	def nav_path_for_offer
	if business_user_signed_in?
  	   business_user_offers_path
    elsif admin_signed_in?
      admin_offers_path
    end
	end
end
