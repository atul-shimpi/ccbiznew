module BusinessUser::PagesHelper
	def businessuser_pages_action(seodetails, action)
		if action == "new" || action == "create"
			business_user_pages_path(seodetails)
		else
			business_user_page_path(seodetails)
		end

	end
end
