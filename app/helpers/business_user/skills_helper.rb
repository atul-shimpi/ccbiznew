module BusinessUser::SkillsHelper
	def business_shop_skills_action(skill, action)
		if action == "new"|| action == "create"
			business_user_skills_path(skill)
		else
			business_user_skill_path(skill)
		end

	end	
end
