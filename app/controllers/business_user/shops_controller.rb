class BusinessUser::ShopsController < BusinessUser::BaseController

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

    respond_to do |format|
      if @shop.save
        format.html { redirect_to business_user_shop_path, notice: 'Shop was successfully created.' }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shop = current_business_user.shops.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(shop_params)
        format.html { redirect_to business_user_shops_path, notice: 'Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = Shop.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to business_user_shops_url }
      format.json { head :no_content }
    end
  end




   private

  def shop_params
    params.require(:shop).permit(:name, :phone, :address, :info, :user_id, :avatar, :category_id, :template, :subdomain, :city, :state, :country, :zip, :facebook, :linkedin, :google, :twitter)
  end


end
