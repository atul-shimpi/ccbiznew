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
  def nav_path_for_event
  if business_user_signed_in?
       business_user_events_path
    elsif admin_signed_in?
      admin_events_path
    end
  end
  def nav_path_for_single_shop  
    if admin_signed_in?
      admin_single_business_users_path
    end
  end
  def nav_path_for_profile
  if business_user_signed_in?
      edit_business_user_business_user_path(current_business_user)
    elsif admin_signed_in?
      
    end
  end
end
