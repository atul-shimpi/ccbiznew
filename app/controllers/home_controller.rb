class HomeController < ApplicationController
	def index
		@shop = Shop.find_by_subdomain(request.subdomain)
		if !@shop.blank?
    		render :template => "templates/#{@shop.template}", :layout => false
		else
			redirect_to new_business_user_session_path
		end
	end
end
