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
		@seodetails = @shop.seodetails.where("pagename = 'about'")
		if !@shop.info.blank?
			render :template => "templates/about_us", :layout => "#{@shop.template}"
		else
			redirect_to root_path			
		end
	end

	def contact_us
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		@seodetails = @shop.seodetails.where("pagename = 'contact'")
		@contact = Contact.new  
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/contact_us", :layout => "#{@shop.template}"
	end
	def update_contact_us		
		
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		@contact = Contact.new(contact_params)

	    respond_to do |format|
	      if @contact.save
	        format.html { redirect_to contact_us_path, notice: 'Contact info was posted successfully.'}
	        format.json { render json: @contact, status: :created, location: @contact }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @contact.errors, status: :unprocessable_entity }
	      end
	    end
		
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		
		
	end

	def gallery
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		@seodetails = @shop.seodetails.where("pagename = 'gallery'")
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/gallery", :layout => "#{@shop.template}"
	end

	def donation
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/donation", :layout => "#{@shop.template}"
	end
	def shop_events
		subdomain = request.subdomain.split(".").last
		@shop = Shop.find_by_subdomain(subdomain)
		@seodetails = @shop.seodetails.where("pagename = 'events'")
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.events.blank?
			render :template => "templates/events", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end
	def contact_params
	    params.require(:contact).permit(:contactname, :contactemail, :contactnumber, :contactinfo, :shoprating, :shop_id)
	end

	def sports_1
		render :layout => false

	end
	def sports_2
		render :layout => false
	end
	def education_1
		render :layout => false
	end
	def education_2
		render :layout => false
	end
	def education_3
		render :layout => false
	end
	def health_1
		render :layout => false
	end
end
