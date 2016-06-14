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
      business_user_business_user_path(current_business_user)
    elsif admin_signed_in?
      
    end
  end
  def nav_path_for_auction
    if business_user_signed_in?
      business_user_auctions_path
    elsif admin_signed_in?
      
    end
  end
  def nav_path_for_siteuser
    if business_user_signed_in?
      business_user_site_users_path
    elsif admin_signed_in?
      
    end
  end
  
  def unassignedplayers(auction_id)
    auction = Auction.find(auction_id)
    return auction.players.where(:team_id => nil)
  end
  def get_page_name(shopid, pagename, defaultname)
    pagename = Seodetail.where(:pagename => pagename, :shop_id => shopid)            
    if !pagename.blank?
      if pagename.first.pagealias
        return pagename.first.pagealias
      else
        return defaultname
      end
    else
      return defaultname
    end
  end
end
