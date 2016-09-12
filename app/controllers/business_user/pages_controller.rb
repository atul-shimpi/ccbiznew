class BusinessUser::PagesController < ApplicationController
  before_action :get_shop, except: [:designupdate, :show, :imageupload]
  protect_from_forgery except: [:designupdate, :imageupload]
  
  def index    
    @shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }    
    #@shop_seo = Seodetail.where(shop_id:@shops_ids)    
    @shop_seo = @shop.seodetails    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_seo }
    end
  end
  def new
    @shop_seo = Seodetail.new    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_seo }
    end
  end
  def show
    @shop_seo = Seodetail.find(params[:id])
    render :json => @shop_seo.pagecontent.as_json
  end

  def edit
    @shop_seo = Seodetail.find(params[:id])
  end

  def create
    @shop_seo = Seodetail.new(seodetail_params)
    if seodetail_params[:pagename] == "other"
      @shop_seo.pagename = params[:otherpage]
      @shop_seo.extrapage = true
    else
      @shop_seo.extrapage = false
    end
    @shop_seo.shop_id = @shop.id
    respond_to do |format|
      if @shop_seo.save        
        format.html { redirect_to business_user_pages_path(:shop_id => @shop.id), notice: 'Page was successfully created.' }
        format.json { render json: @shop_seo, status: :created, location: @shop_seo }
      else
        
        format.html { render action: "new" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    @shop_seo = Seodetail.find(params[:id])
    if seodetail_params[:pagename] == "other"
      @shop_seo.pagename = params[:otherpage]
      @shop_seo.extrapage = true
    else
      @shop_seo.extrapage = false
    end
    respond_to do |format|
      if @shop_seo.update_attributes(seodetail_params)
        format.html { redirect_to business_user_pages_path(:shop_id => @shop.id), notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    
    @page = Seodetail.find(params[:id])
    ActiveRecord::Base.connection.disable_referential_integrity do
      @page.destroy
    end

    respond_to do |format|
      format.html { redirect_to business_user_pages_path(:shop_id => @shop.id), alert: 'Page deleted successfully.' }
      format.json { head :no_content }
    end
  end
  def design
    @page = Seodetail.find(params[:page_id])
    render :layout => false
  end
  def designupdate
    if !params['data'].blank?      
      @page = Seodetail.find(params['data']['page_id'])
      
      @page['pagecontent'] = params['data'].to_json
      @page.save
      render :nothing => true
    end
    
  end
  def imageupload
    begin
      image = S3Store.new(params[:upload][:image]).store
      #...
    rescue Exception => e
      #...
    end
    binding.pry
  end
  private  
  def get_shop
    @shop = Shop.find(params[:shop_id])
  end
  def seodetail_params
    params.require(:seodetail).permit(:shop_id, :title, :metakeywords, :metadescription, :pagename, :pagealias, :parentpage, :pagecontent, :headerbg, :footerbg)
  end  
end
