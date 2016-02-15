class Admin::ShopsController < Admin::BaseController

  def index
    @shops = Shop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])

    render :template => "templates/#{@shop.template}", :layout => false
  end

  def new
    @shop = current_admin.shops.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = current_admin.shops.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to admin_shop_path(@shop), notice: 'Shop was successfully created.' }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@shop = current_admin.shops.find(params[:id])
    @shop = Shop.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(shop_params)
        format.html { redirect_to admin_shops_url(), notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to admin_shops_url }
      format.json { head :no_content }
    end
  end




   private

  def shop_params
    params.require(:shop).permit(:name, :phone, :address, :info, :user_id, :avatar,:backgroundimage, :category_id, :template, :subdomain, :metakeywords, :metadescription, :googleanalytics, :isactive)
  end
end
