class Admin::SeodetailsController < ApplicationController
  before_action :get_shop, only: [:index, :new, :create, :edit, :update]
  def index    
    @shop_seo = @shop.seodetails.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_seo }
    end
  end
  def new
    @shop_seo = @shop.seodetails.new    
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
    @shop_seo = @shop.seodetails.find(params[:id])
  end

  def create
    @shop_seo = @shop.seodetails.new(seodetail_params)

    respond_to do |format|
      if @shop_seo.save
        format.html { redirect_to admin_seodetails_path(:shop_id => @shop.id), notice: 'Business website was successfully created.' }
        format.json { render json: @shop_seo, status: :created, location: @shop_seo }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    
    @shop_seo = @shop.seodetails.find(params[:id])

    respond_to do |format|
      if @shop_seo.update_attributes(seodetail_params)
        format.html { redirect_to admin_seodetails_path(:shop_id => @shop.id), notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_seo.errors, status: :unprocessable_entity }
      end
    end
  end

  private  
  def seodetail_params
    params.require(:seodetail).permit(:shop_id, :title, :metakeywords, :metadescription, :pagename)
  end
  def get_shop    
    @shop = Shop.find(params[:shop_id])
  end
end
