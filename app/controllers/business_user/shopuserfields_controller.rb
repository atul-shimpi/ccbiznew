class BusinessUser::ShopuserfieldsController < ApplicationController
  before_action :get_shop

  def index
    @shop_fields = @shop.fields.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_fields }
    end
  end
  private

  
  def shop_params
    params.require(:shop).permit(:name, :phone, :address, :info, :homecontent, :user_id, :avatar,:backgroundimage, :removebg, :category_id, :template, :subdomain, :domain, :city, :state, :country, :zip, :facebook, :linkedin, :google, :twitter, :shoptype, :latitude, :longitude, :backgroundimage_cache, :addressname, :buildingname, :blockno, :gallerytype, :loginenabled, :headerbg, :footerbg, :fields_attributes)
  end
  def get_shop    
  	@shop = Shop.find(params[:shop_id])
  end
end
