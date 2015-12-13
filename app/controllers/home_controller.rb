class HomeController < ApplicationController
	def index
		@shop = Shop.find_by_subdomain(request.subdomain)
		if !@shop.blank?
    		render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"
		else
			redirect_to new_business_user_session_path
		end
	end

	def about_us
		@shop = Shop.find_by_subdomain(request.subdomain)
		render :template => "templates/about_us", :layout => "#{@shop.template}"
	end

	def contact_us
		@shop = Shop.find_by_subdomain(request.subdomain)
		@location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		binding.pry
		render :template => "templates/contact_us", :layout => "#{@shop.template}"
	end
end
