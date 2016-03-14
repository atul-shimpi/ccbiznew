module Admin::SeodetailsHelper
	def adminshop_seodetails_action(seodetails, action)
		if action == "new"
			admin_seodetails_path(seodetails)
		else
			admin_seodetail_path(seodetails)
		end

	end
end
