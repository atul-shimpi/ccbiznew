class ShopsController < ApplicationController
	# before_action :get_user

	  def index
    @shops = @user.shops.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shops }
    end
  end

  def show
    @shop = Shop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @shop = @user.shops.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop }
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = @user.shops.new(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to @shop, notice: 'Business website was successfully created.' }
        format.json { render json: @shop, status: :created, location: @shop }
      else
        format.html { render action: "new" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shop = @user.shops.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(shop_params)
        format.html { redirect_to @shop, notice: 'Business website was successfully updated.' }
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
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end


   private

  def shop_params
    params.require(:shop).permit(:name, :phone, :address, :info, :user_id, :avatar)
  end


  
end
