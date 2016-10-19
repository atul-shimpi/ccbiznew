class FilesController < ApplicationController	
	before_action :get_shop
	def index		

    @userfiles = current_site_user.userfiles.all    
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
    render :template => "templates/files", :layout => "modulepage"  
    #render :template => "templates/files", :layout => "#{@shop.template}"
  end

  def show
    @userfile = Userfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @userfile = current_site_user.userfiles.new
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
    render :template => "templates/newfiles", :layout => "modulepage"  
    #render :template => "templates/newfiles", :layout => "#{@shop.template}"
  end

  def edit
    @userfile = Userfile.find(params[:id])
  end

  def create    
    @userfile = current_site_user.userfiles.new(files_params)         
    respond_to do |format|      
      if @userfile.save                
        format.html {           
          redirect_to files_path(:site_user_id => current_site_user.id), notice: 'Business website was successfully created.'                   
        }
        format.json { render json: @userfile, status: :created, location: @userfile }
      else
        render :template => "templates/newfiles", :layout => "#{@shop.template}"
      end
    end
  end  
  def update
    @userfile = current_site_user.shop_image.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(files_params)
        format.html { redirect_to business_user_shops_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def download
  	
  	@model = Userfile.find(params[:id])        
    data = open(@model.filename_url) 

    send_data data.read, filename: @model.filename_identifier, type: @model.filename.content_type, disposition: 'attachment', stream: 'true'    
  end
  def destroy
    @userfile = Userfile.find(params[:id])
    @shop_image.destroy

    respond_to do |format|
      format.html { redirect_to business_user_shop_images_path(:shop_id => @shop.id) }
      format.json { head :no_content }
    end
  end


  private

  def files_params
    params.require(:userfile).permit(:site_user_id, :filename_cache,  :filename)
  end
  def get_shop    
  	subdomain = request.subdomain.split(".").last		
		if subdomain.blank? || subdomain =='www'			
			@shop = Shop.find_by_domain(request.host)	
		else
			@shop = Shop.find_by_subdomain(subdomain)	
		end
  end

end
