class HomeController < ApplicationController
	impressionist :actions=>[:auction]
	def index		

		subdomain = request.subdomain.split(".").last		
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		
		@seodetails = @shop.seodetails.where("pagename = 'home'") rescue nil
		
		if !@shop.blank?
    		render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"
		else
			redirect_to new_business_user_session_path
		end
	end

	def about_us
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		
		@seodetails = @shop.seodetails.where("pagename = 'about'") rescue nil
		if !@shop.info.blank?
			render :template => "templates/about_us", :layout => "#{@shop.template}"
		else
			redirect_to root_path			
		end
	end

	def contact_us
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'contact'") rescue nil
		@contact = Contact.new  
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/contact_us", :layout => "#{@shop.template}"
	end
	def update_contact_us		
		
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
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
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'gallery'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		@images = @shop.shop_images.where("imagetype = 1")
		
		if !@shop.shop_images.blank?
			render :template => "templates/gallery", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end

	def donation
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'donation'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		render :template => "templates/donation", :layout => "#{@shop.template}"
	end
	def shop_events
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'events'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.events.blank?
			render :template => "templates/events", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end

	def auction
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'auction'") rescue nil
		@players = @shop.auction.players.not_in_team
		impressionist(@shop.auction)
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			render :template => "templates/auction", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end
	def compare_teams
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		@players = Player.not_in_team
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			render :template => "templates/compare_teams", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end

	def player
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'player'") rescue nil
		@player = Player.find(params[:id])
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			render :template => "templates/player", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end
	def teams
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			render :template => "templates/teams", :layout => "#{@shop.template}"
		else
			redirect_to root_path
		end
	end
	def team
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		@team = Team.find(params[:id])
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			render :template => "templates/team", :layout => "#{@shop.template}"
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
	def entertainment_1
		render :layout => false
	end
	def entertainment_2
		render :layout => false
	end
	def entertainment_3
		render :layout => false
	end
	def food_1
		render :layout => false
	end
	def food_2
		render :layout => false
	end
	def clothes_1
		render :layout => false
	end
	def clothes_2
		render :layout => false
	end
end
