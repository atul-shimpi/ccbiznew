module Admin::UsersHelper
	def admin_user_action(user, action)
		if action == "new"
			admin_users_path(user)
		else
			admin_user_path(user)
		end

	end
end
