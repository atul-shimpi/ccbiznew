class BusinessUser::PagesController < ApplicationController
  def index    
    @shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }    
    @shop_seo = Seodetail.where(shop_id:@shops_ids)    
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
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop_seo = Seodetail.find(params[:id])
  end

  def create
    @shop_seo = Seodetail.new(seodetail_params)

    respond_to do |format|
      if @shop_seo.save
        format.html { redirect_to business_user_pages_path, notice: 'Business website was successfully created.' }
        format.json { render json: @shop_seo, status: :created, location: @shop_seo }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    @shop_seo = Seodetail.find(params[:id])

    respond_to do |format|
      if @shop_seo.update_attributes(seodetail_params)
        format.html { redirect_to business_user_pages_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end

  private  
  def seodetail_params
    params.require(:seodetail).permit(:shop_id, :title, :metakeywords, :metadescription, :pagename, :pagealias)
  end  
end
