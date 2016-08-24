module BusinessUser::SiteUsersHelper
	def business_shop_site_users_action(siteuser, action)
		if action == "new" || action == "create"
			business_user_site_users_path(siteuser)
		else			
			business_user_site_user_path(siteuser)
		end
	end
end
