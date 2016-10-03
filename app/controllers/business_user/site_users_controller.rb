class BusinessUser::SiteUsersController < ApplicationController
	#before_action :get_shop

	def index
		@shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }    
    @shop_users = SiteUser.where(shop_id:@shops_ids)    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_users }
    end
  end
  def new
    @siteuser = SiteUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @siteuser }
    end
  end

  def edit
    @siteuser = SiteUser.find(params[:id])
  end
  def properties

    @siteuser = SiteUser.find(params[:id])    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @siteuser }
    end
  end
  def subscriptionlist    
    @siteuser = SiteUser.find(params[:id])    
    @subscriptions = current_business_user.subscriptions.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @siteuser }
    end
  end
  def create
    @siteuser = SiteUser.new(siteuser_params)

    respond_to do |format|
      if @siteuser.save
        format.html { redirect_to business_user_site_users_path, notice: 'User was successfully created.' }
        format.json { render json: @siteuser, status: :created, location: @siteuser }
      else
        format.html { render action: "new" }
        format.json { render json: @siteuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update    
    @siteuser = SiteUser.find(params[:id])    
    respond_to do |format|
      if @siteuser.update_attributes(siteuser_params)
        format.html { redirect_to business_user_site_users_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @siteuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @siteuser = SiteUser.find(params[:id])
    payment = Payment.where("site_user_id":params[:id])
    
    @siteuser.payments.delete(payment)

    @siteuser.destroy 

    respond_to do |format|
      format.html { redirect_to business_user_site_users_path }
      format.json { head :no_content }
    end
  end

  private  
  def siteuser_params
    params.require(:site_user).permit(:email, :shop_id, :password, :password_confirmation, { subscription_ids:[] }).tap do |whitelisted|
      whitelisted[:properties] = params[:site_user][:properties]
    end 
  end
  
end
