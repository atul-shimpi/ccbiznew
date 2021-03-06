class HomeController < ApplicationController
	require 'open-uri'

	impressionist :actions=>[:auction]
	protect_from_forgery except: [:update_contact_us]
	helper_method :get_current_page

	def  home
		render :layout => false		
	end

	def index		
		subdomain = request.subdomain.split(".").last		
		
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end		
			
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		
		@seodetails = @shop.seodetails.where("pagename = 'home'") rescue nil
			
		if !@shop.blank?
			@homepage = Seodetail.where('shop_id = ? and ishomepage = ?', @shop.id, 1)		
			if !@homepage.empty?
				@seodetails = @shop.seodetails.where("id = ?",@homepage[0].id) rescue nil				
				if !@seodetails[0].htmldata.nil? and !@seodetails[0].htmldata.blank?
					if !@seodetails[0].htmldata["pages"].nil? and !@seodetails[0].htmldata["pages"].blank?
						if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
							if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
								@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
							end
						end
						if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
							if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
								@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
							end
						end
						@page_blocks = JSON.parse(@seodetails[0].htmldata)["pages"]["index"]["blocks"]		
						# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
						render :template => "templates/pageshow", :layout => "page"
					else
						render :template => "templates/about_us", :layout => "#{@shop.template}"
					end
				else
					render :template => "templates/about_us", :layout => "#{@shop.template}"
				end
			else
				render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"	
			end    		
		else			
			redirect_to home_path
		end
		
	end
	
	def about_us
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		
		@seodetails = @shop.seodetails.where("pagename = 'about'") rescue nil
		if !@shop.info.blank?
			if @shop.template.present?
				render :template => "templates/about_us", :layout => "#{@shop.template}"
			else
				render :template => "templates/about_us", :layout => "page"
			end
		else
			redirect_to root_path			
		end
	end

	def contact_us
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'contact'") rescue nil
		@contact = Contact.new  
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if @shop.template.present?
			render :template => "templates/contact_us", :layout => "#{@shop.template}"
		else
			render :template => "templates/contact_us", :layout => "page"
		end
	end

	def update_contact_us		
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end		
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@contact = Contact.new(contact_params)
	    respond_to do |format|
	      if @contact.save
	        format.html { redirect_to request.env['HTTP_REFERER'], notice: 'Thank you for contacting us will get back to you soon'}
	        format.json { render json: @contact, status: :created, location: @contact }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @contact.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def gallery
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'gallery'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		@images = @shop.shop_images.where("imagetype = 1")
		
		if !@shop.shop_images.blank?
			custom_render_template("templates/gallery")
			# if @shop.template.present?
			# 	render :template => "templates/gallery", :layout => "#{@shop.template}"
			# else
			# 	render :template => "templates/gallery", :layout => "page"
			# end
		else
			redirect_to root_path
		end
	end

	def donation
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'donation'") rescue nil
		custom_render_template("templates/donation")
		# if @shop.template.present?
		# 	render :template => "templates/donation", :layout => "#{@shop.template}"
		# else
		# 	render :template => "templates/donation", :layout => "page"
		# end
	end

	def shop_events
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'events'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.events.blank?
			if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
				if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
					@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
				end
			end
			if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
				if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
					@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
				end
			end
			render :template => "templates/events", :layout => "modulepage"
		else
			redirect_to root_path
		end
	end

	def sitemap
		respond_to do |format|
      format.xml
    end
	end

	def robots
		@site = request.host_with_port
		respond_to do |format|
      format.text
    end
	end

	def auction
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'auction'") rescue nil
		if !@shop.auction.blank?
			@players = @shop.auction.players.not_in_team
			impressionist(@shop.auction)
			custom_render_template("templates/auction")
		else
			redirect_to root_path
		end
	end

	def compare_teams
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			@players = Player.not_in_team
			custom_render_template("templates/compare_teams")
		else
			redirect_to root_path
		end
	end

	def player
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'player'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			@player = Player.find(params[:id])
			custom_render_template("templates/player")
		else
			redirect_to root_path
		end
	end

	def teams
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			custom_render_template("templates/teams")
		else
			redirect_to root_path
		end
	end

	def team
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("pagename = 'team'") rescue nil
		# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
		if !@shop.auction.blank?
			@team = Team.find(params[:id])
			custom_render_template("templates/team")
		else
			redirect_to root_path
		end
	end

	# User Section
	def dashboard
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@userfiles = current_site_user.userfiles.all    
		@payments = Payment.where("site_user_id":current_site_user.id)
		if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
			if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
				@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
			end
		end
		if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
			if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
				@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
			end
		end		
		#render :template => "templates/modulepages", :layout => "page"
    render :template => "templates/files", :layout => "modulepage"
	end

	#Dyanamic Pages
	def pageshow
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
		@seodetails = @shop.seodetails.where("lower(slug) = ?",params[:slug]) rescue nil		
		if !@seodetails[0].htmldata.nil? and !@seodetails[0].htmldata.blank?
			if !@seodetails[0].htmldata["pages"].nil? and !@seodetails[0].htmldata["pages"].blank?
				if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
					if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
						@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
					end
				end
				if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
					if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
						@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
					end
				end
				@page_blocks = JSON.parse(@seodetails[0].htmldata)["pages"]["index"]["blocks"]		
				# @location = Geocoder.coordinates("#{@shop.address}, #{@shop.city}, #{@shop.state}, #{@shop.country}, #{@shop.zip}")
				render :template => "templates/pageshow", :layout => "page"
			else
				render :template => "templates/about_us", :layout => "#{@shop.template}"
			end
		else
			render :template => "templates/about_us", :layout => "#{@shop.template}"
		end		
	end

	def contact_params
	    params.require(:contact).permit(:contactname, :contactemail, :contactnumber, :contactinfo, :shoprating, :shop_id)
	end

	def updatepayment
		subdomain = request.subdomain.split(".").last
		if subdomain.blank? || subdomain =='www'				
			if subdomain.nil?
				@shop = Shop.find_by_domain(request.host)	
			else
				@shop = Shop.find_by_domain(request.domain)	
			end	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end		
		@payment = current_site_user.payments.new
		if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
			if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
				@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
			end
		end
		if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
			if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
				@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
			end
		end
		render :template => "Site_User/paymentupdate", :layout => "modulepage"
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

	def social_1
		render :layout => false
	end

	def social_2
		render :layout => false
	end

	def social_3
		render :layout => false
	end

	def footwear_1
		render :layout => false
	end

	public

  def get_current_page
    @current_page ||= params[:id]
  end

  def custom_render_template(page)
  	@custom_page = page
  	if !@shop.blank?
			@homepage = Seodetail.where('shop_id = ?', @shop.id)
			if !@homepage.empty?
				@seodetails = @shop.seodetails.where("id = ?",@homepage[0].id) rescue nil				
				if !@seodetails[0].htmldata.nil? and !@seodetails[0].htmldata.blank?
					if !@seodetails[0].htmldata["pages"].nil? and !@seodetails[0].htmldata["pages"].blank?
						if !@shop.headerhtml.nil? and !@shop.headerhtml.blank?
							if !@shop.headerhtml["pages"].nil? and !@shop.headerhtml["pages"].blank?
								@header_blocks = JSON.parse(@shop.headerhtml)["pages"]["index"]["blocks"]		
							end
						end
						if !@shop.footerhtml.nil? and !@shop.footerhtml.blank?
							if !@shop.footerhtml["pages"].nil? and !@shop.footerhtml["pages"].blank?
								@footer_blocks = JSON.parse(@shop.footerhtml)["pages"]["index"]["blocks"]
							end
						end
						@page_blocks = JSON.parse(@seodetails[0].htmldata)["pages"]["index"]["blocks"]		
						render :template => "templates/custom_page", :layout => "page"
					else
						render :template => "templates/about_us", :layout => "#{@shop.template}"
					end
				else
					render :template => "templates/about_us", :layout => "#{@shop.template}"
				end
			else
				render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"	
			end    		
		else			
			redirect_to home_path
		end
  end
end
