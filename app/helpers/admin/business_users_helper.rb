module Admin::BusinessUsersHelper	
	def admin_businessuser_action(user, action)
		if action == "new"
			admin_business_users_path(user)
		else
			admin_business_user_path(user)
		end

	end
end
