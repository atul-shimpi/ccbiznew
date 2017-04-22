module BusinessUser::TeamsHelper
	def business_shop_teams_action(team, action)
		if action == "new" || action == "create"
			business_user_teams_path(team)
		else
			business_user_team_path(team)
		end

	end	
end
