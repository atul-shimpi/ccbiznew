class BusinessUser::ShopsController < BusinessUser::BaseController
  require 'net/http'
	def index
    @shops = current_business_user.shops.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])

    render :template => "templates/#{@shop.template}", :layout => "#{@shop.template}"
  end

  def new
    @shop = current_business_user.shops.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop = Shop.find(params[:id])

  end

  def create
    @shop = current_business_user.shops.new(shop_params)
    if params[:shop][:shoptype] == "1" && @shop.storeid.nil?
      
      if current_business_user.storeuserid.nil? || current_business_user.storeuserid == 0
        userid = user_creation_process
      else
        userid = current_business_user.storeuserid
      end      
      if !userid
        respond_to do |format|
          format.html { render action: "edit" , error: 'There is problem with store creation try later or contact administratore' } 
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      else
        current_business_user.update_attributes("storeuserid"=>userid)  
        storeid = store_creation_process(userid, params[:shop])
        if storeid
          @shop.update_attributes("storeid"=>storeid) 
          redirect_to "http://#{@shop.subdomain}."+Rails.application.secrets.store_url+"/spree/api/v1/login/sign_in?user[email]=#{current_business_user.email}&user[password]=reset123", notice: 'Business website was successfully updated.'
        else
          respond_to do |format|
            format.html { render action: "edit", error: 'There is problem with store creation try later or contact administratore' }
            format.json { render json: @shop.errors, status: :unprocessable_entity }
          end
        end  
      end
      
    else
      respond_to do |format|
        if @shop.save
          
          format.html { redirect_to business_user_shops_path, notice: 'Shop was successfully created.' }
          format.json { render json: @shop, status: :created, location: @shop }
        else        
          
          
          format.html { render action: "new" }
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    @shop = current_business_user.shops.find(params[:id])     
   
    if params[:shop][:shoptype] == "1" && @shop.storeid.nil?
      
      if current_business_user.storeuserid.nil? || current_business_user.storeuserid == 0
        userid = user_creation_process
      else
        userid = current_business_user.storeuserid
      end      
      if !userid
        respond_to do |format|
          format.html { render action: "edit" , error: 'There is problem with store creation try later or contact administratore'} 
          format.json { render json: @shop.errors, status: :unprocessable_entity }

        end
      else
        current_business_user.update_attributes("storeuserid"=>userid)  
        storeid = store_creation_process(userid, params[:shop])
        if storeid
          @shop.update_attributes("storeid"=>storeid) 
          respond_to do |format|
            format.html { redirect_to business_user_shops_path, notice: 'Business website was successfully updated.' }
            format.json { head :no_content }
          end
        else
          respond_to do |format|
            format.html { render action: "edit", error: 'There is problem with store creation try later or contact administratore' }
            format.json { render json: @shop.errors, status: :unprocessable_entity }
          end
        end  
      end
    else
      respond_to do |format|      
        if @shop.update_attributes(shop_params)
          if params[:removebg]                    
            @shop.remove_backgroundimage!
            @shop.remove_backgroundimage = true
            @shop.save          
          end
          
          format.html { redirect_to business_user_shops_path, notice: 'Business website was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @shop.errors, status: :unprocessable_entity }
        end
      end  
    end 
    
    
  end

  def destroy
    @user = Shop.find(params[:id])
    ActiveRecord::Base.connection.disable_referential_integrity do
      @user.destroy
    end

    respond_to do |format|
      format.html { redirect_to business_user_shops_url }
      format.json { head :no_content }
    end
  end




  private

  def shop_params
    params.require(:shop).permit(:name, :phone, :address, :info, :homecontent, :user_id, :avatar,:backgroundimage, :removebg, :category_id, :template, :subdomain, :domain, :city, :state, :country, :zip, :facebook, :linkedin, :google, :twitter, :shoptype, :latitude, :longitude, :backgroundimage_cache, :addressname, :buildingname, :blockno, :gallerytype)
  end

  def user_creation_process
    
    uri = URI.parse(Rails.application.secrets.store_api_url+"api/v1/users")
    
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"token"=>Rails.application.secrets.store_api_key, "user[email]" => current_business_user.email, "user[password]" => "reset123", "user[spree_role_ids]"=>1})

    response = http.request(request)
    puts "user createion"+response.body
    if response.code == "201"      
      response = JSON.parse(response.body)
      
      return response["id"]
    else
      
      flash[:error] = JSON.parse(response.body)["error"]
      flash[:error] = "There is problem creating your store, Please contact administrater"
      return false
    end
    
  end

  def store_creation_process(userid, shop)
    uri = URI.parse(Rails.application.secrets.store_api_url+"api/v1/stores")
    
    http = Net::HTTP.new(uri.host, uri.port)
    
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data({"token"=>Rails.application.secrets.store_api_key, "store[url]" => shop["subdomain"]+"."+Rails.application.secrets.store_url, "store[name]" => shop["name"], "store[code]" => shop["subdomain"], "store[mail_from_address]"=>current_business_user.email, "store[spree_user_id]"=>userid, "store[layout]"=>shop["template"], "store[default_currency]"=>"INR"})

    response = http.request(request)
    puts response.body
    if response.code == "201"      
      response = JSON.parse(response.body)      
      return response["id"]
    else      
      flash[:error] = JSON.parse(response.body)["error"]
      flash[:error] = "Please choose another sub-domain"
      return false
    end
  end
end
