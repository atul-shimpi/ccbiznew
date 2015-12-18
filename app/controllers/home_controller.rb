class HomeController < ApplicationController
	def index
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		if !@shop.blank?
    		render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"
		else
			redirect_to new_business_user_session_path
		end
	end

	def about_us
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		render :template => "templates/about_us", :layout => "#{@shop.template}"
	end

	def contact_us
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		@location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/contact_us", :layout => "#{@shop.template}"
	end
end
