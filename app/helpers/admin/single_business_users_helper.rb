module Admin::SingleBusinessUsersHelper
	def single_shop_events_action(event, action)
		if action == "new"
			admin_single_business_users_path(event)
		else
			admin_single_business_user_path(event)
		end

	end
end
