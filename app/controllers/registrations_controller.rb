class RegistrationsController < Devise::RegistrationsController
  layout "modulepage"
  def new
    super
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
	  
	  @seodetails = Seodetail.where('shop_id = ? and ishomepage = ?', @shop.id, 1)    
	  @page_blocks = JSON.parse(@seodetails[0].htmldata)["pages"]["index"]["blocks"]    
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
	  render :template => "Site_User/registrations/new"
  end

  def create
    # add custom create logic here
    super
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
	  
	  @seodetails = Seodetail.where('shop_id = ? and ishomepage = ?', @shop.id, 1)    
	  @page_blocks = JSON.parse(@seodetails[0].htmldata)["pages"]["index"]["blocks"]    
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
	  render :template => "Site_User/registrations/new"
  end

  def update
    super
  end
end 